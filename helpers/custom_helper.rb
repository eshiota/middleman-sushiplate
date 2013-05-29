module CustomHelpers
  def post_image(opts)
    post_image_tag(opts)
  end

  def post_responsive_image(opts)
    post_image_tag(opts.merge({ :responsive => true }))
  end

  def picturefill_tag(opts)
    content_tag :div, :data => { :picture => "", :alt => opts[:alt]} do
      opts[:sizes].each do |size|
        # Strangely, this is the only way I got this empty div tag to
        # be properly printed and parsed
        content_tag :div, :data => { :media => size[:media], :src => size[:src] } do
          " "
        end
      end

      opts[:sizes].select { |s| s[:canonical] }.each do |size|
        content_tag :noscript do
          "<img src='#{size[:src]}' alt='#{opts[:alt]}' />"
        end
      end
    end
  end

  private

  def post_image_tag(opts)
    content_tag :figure, :class => "post-media" do
      link_to opts[:full], :title => "View full sized image" do
        if opts[:responsive]
          picturefill_tag(opts)
        else
          "<img src='#{opts[:src]}' alt='#{opts[:alt]}' />"
        end
      end

      if (opts[:caption])
        content_tag :figcaption, :class => "caption" do
          opts[:caption]
        end
      end
    end
  end
end
