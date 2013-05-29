###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, "stylesheets"

set :js_dir, "javascripts"

set :images_dir, "images"

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :gzip
end

# Deployment configuration for middleman-sync
# https://github.com/karlfreeman/middleman-sync
activate :sync do |sync|
  sync.fog_provider = "AWS"
  # sync.fog_directory = "YOUR_FOG_DIRECTORY"
  sync.fog_region = "us-east-1"
  sync.aws_access_key_id = ENV["AWS_ACCESS_KEY_ID"]
  sync.aws_secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
  sync.existing_remote_files = "delete"
  sync.gzip_compression = true
end

activate :directory_indexes
