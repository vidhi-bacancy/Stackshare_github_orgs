class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :github_login
      t.bigint :github_id
      t.string :node_id
      t.string :url
      t.string :repos_url
      t.string :events_url
      t.string :hooks_url
      t.string :issues_url
      t.string :members_url
      t.string :public_members_url
      t.string :avatar_url
      t.text :description
      t.string :org_name
      t.string :company
      t.string :blog
      t.string :location
      t.string :email
      t.string :twitter_username
      t.boolean :is_verified
      t.boolean :has_organization_projects
      t.boolean :has_repository_projects
      t.bigint :public_repos
      t.bigint :public_gists
      t.integer :followers
      t.integer :following
      t.string :html_url
      t.datetime :org_created_at
      t.datetime :org_updated_at
      t.string :type

      t.timestamps
    end
  end
end
