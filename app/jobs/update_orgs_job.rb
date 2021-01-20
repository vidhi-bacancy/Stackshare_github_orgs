class UpdateOrgsJob < ApplicationJob
  queue_as :default

  def perform(*args)
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
