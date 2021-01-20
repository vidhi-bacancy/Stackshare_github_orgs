class OrganizationsController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'net/https'
	require 'json'

	def new
	end

	def create
		uri = URI('https://api.github.com/organizations')
		data = []
		@since_val = (Organization.last.present? ? Organization.last.github_id : 110000000)
		start_str = 'since='
		end_str = '&'
		for i in 1..49
			parameters = {'since' => @since_val, 'per_page' => 100, 'access_token' => '389eb56427728b72307846c34c33478aff57b823', 'accept' => 'application/vnd.github.v3+json' }
			uri.query = URI.encode_www_form(parameters)
		  response = Net::HTTP.get_response(uri)
		  organizations = JSON.parse(response.body)
		  input_str = response.to_hash['link'].first
		  @since_val = input_str[/#{start_str}(.*?)#{end_str}/m, 1]
		  organizations.each do |organization|
		  	org_uri = URI("https://api.github.com/orgs/#{organization['login']}")
		  	org_param = {'access_token' => '389eb56427728b72307846c34c33478aff57b823', 'accept' => 'application/vnd.github.v3+json' }
				org_uri.query = URI.encode_www_form(org_param)
			  org_res = Net::HTTP.get_response(org_uri)
			  org_details = JSON.parse(org_res.body)
			  puts "=========#{org_details}========"
		  	Organization.create(github_login: org_details['login'], github_id: org_details['id'], node_id: org_details['node_id'], url: org_details['url'], repos_url: org_details['repos_url'], events_url: org_details['events_url'], hooks_url: org_details['hooks_url'], issues_url: org_details['issues_url'], members_url: org_details['members_url'], public_members_url: org_details['public_members_url'], avatar_url: org_details['avatar_url'], description: org_details['description'], org_name: org_details['name'], company: org_details['company'], blog: org_details['blog'], location: org_details['location'], email: org_details['email'], twitter_username: org_details['twitter_username'], is_verified: org_details['is_verified'], has_organization_projects: org_details['has_organization_projects'], has_repository_projects: org_details['has_repository_projects'], public_repos: org_details['public_repos'], public_gists: org_details['public_gists'], followers: org_details['followers'], following: org_details['following'], html_url: org_details['html_url'], org_created_at: org_details['created_at'], org_updated_at: org_details['updated_at'], type: org_details['type'])
		  end
		  puts "=============page number #{i}"
		  puts "=============Latest since value: #{@since_val}"
		end
		puts "Last Since value is: #{@since_val}"
		redirect_to new_organization_path
	end

	def update_orgs
		for i in 1..5000
		 	organizations = Organization.where(org_created_at: nil)
		  organizations.each do |organization|
		  	uri = URI("https://api.github.com/orgs/#{organization.github_login}")
		  	param = {'access_token' => '389eb56427728b72307846c34c33478aff57b823', 'accept' => 'application/vnd.github.v3+json' }
				uri.query = URI.encode_www_form(param)
			  res = Net::HTTP.get_response(uri)
			  org_details = JSON.parse(res.body)
			  puts "=========#{org_details}========"
			  organization.update(org_name: org_details['name'], company: org_details['company'], blog: org_details['blog'], location: org_details['location'], email: organization['email'], twitter_username: org_details['twitter_username'], is_verified: org_details['is_verified'], has_organization_projects: org_details['has_organization_projects'], has_repository_projects: org_details['has_repository_projects'], public_repos: org_details['public_repos'], public_gists: org_details['public_gists'], followers: org_details['followers'], following: org_details['following'], html_url: org_details['html_url'], org_created_at: org_details['created_at'], org_updated_at: org_details['updated_at'], type: org_details['type'])
		  end
		end
	end
end
