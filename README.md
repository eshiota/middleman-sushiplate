# middleman-sushiplate

A [middleman](http://middlemanapp.com/) template boilerplate with SCSS,
modular, HTML5 sushi flavor. No frills, no grids, no UI elements. Just the basics.

## WUT? No Twitter Bootstrap?

This is the base structure I generally use on projects, with separate folders
and files to allow easy modular interface development, SMACSSS, OOCSS, and all
those other pretty acronyms; lean, HTML5 Boilerplate-based layout; and some
useful helpers and mixins I've developed and collected across the Interwebz.

The sushiplate mindset is: start raw, make it your own. Develop your own grid,
UI elements, or add external ones as needed.

## Usage

1. Install middleman: `gem install middleman`
2. Clone this repo: `git clone git://github.com/eshiota/middleman-sushiplate.git ~/.middleman/sushiplate`
3. Create your middleman project with the sushiplate template: `middleman init my_project --template=sushiplate`
4. Go to your project's directory and run bundle install: `cd my_project; bundle install`

## Deploying to Amazon S3

Props to @lucasmazza on the deployment process config and README

First, be sure to have your production credentials for AWS available
on your environment, either using [awsenv](https://github.com/mv/awsenv)
or exporting then by yourself.

```
export AWS_ACCESS_KEY_ID=<your access key>
export AWS_SECRET_ACCESS_KEY=<your secret key>
```

Uncomment and insert your S3 bucket/region on `config.rb`

```
sync.bucket = 'www.yourbucket.com'
sync.region = 'sa-east-1'
```

Then, build a fresh version of the website with `middleman build`
(so you won't upload an outdated version of the website) and upload
the build output with `middleman s3_sync`.

```
# Build the static site into `./build`.
middleman build
# Upload everything in `./build` to S3.
middleman s3_sync
```

View more sync options at the [middleman-s3_sync repo](https://github.com/fredjean/middleman-s3_sync).

## Included helpers

When using these image helpers, be wary that the path is relative to the
**document**, and will not reference the `:images_dir` defined in the config
file. This is because of [middleman-blog](https://github.com/middleman/middleman-blog/)'s
[article subdirectory](http://middlemanapp.com/blogging/#toc_11). With relative
paths, it's easier to reference images on the article's directory.

### Picturefill helper

This helper prints an output HTML fit to be used with [Picturefill](https://github.com/scottjehl/picturefill). It accepts a hash with:

* `:sizes` - an array of hashes with the image's source and a media query-like syntax
* `:full` - the full image link
* `:alt` - the image's alt information

Usage:

```ruby
<%= picturefill_tag({
      :sizes => [
        { :src => "tuna_small.jpg", :media => "(max-width: 640px)" },
        { :src => "tuna_small@2x.jpg", :media => "(max-width: 640px) and (min-device-pixel-ratio: 1.5)" },
        { :src => "tuna_large.jpg", :media => "(min-width: 641px)", :canonical => true },
        { :src => "tuna_large@2x.jpg", :media => "(min-width: 641px) and (min-device-pixel-ratio: 1.5)" }
      ],
      :full => "tuna_full.jpg",
      :alt => "Tasty tuna sushi"
    })
%>
```

Output:

```html
<div data-alt='Tasty tuna sushi' data-picture>
  <div data-media='(max-width: 640px)' data-src='tuna_small.jpg'> </div>
  <div data-media='(max-width: 640px) and (min-device-pixel-ratio: 1.5)' data-src='tuna_small@2x.jpg'> </div>
  <div data-media='(min-width: 641px)' data-src='tuna_large.jpg'> </div>
  <div data-media='(min-width: 641px) and (min-device-pixel-ratio: 1.5)' data-src='tuna_large@2x.jpg'> </div>
  <noscript>
    <img alt='Tasty tuna sushi' src='tuna_large.jpg' />
  </noscript>
</div>
```

### Blog post image helper

This helper prints a markup suitable for images inside blog posts. It wraps
the image inside a `<figure>` element, with an optional `<figcaption>` with
the image's caption (optional). It accepts a hash with:

* `:src` - source of the image
* `:full` - the full image link
* `:alt` - the image's alt information
* `:caption` (optional) - the image's caption that will be displayed
  under it

Usage:

```ruby
<%= post_image({
      :src => "onigiri.png",
      :full => "onigiri_full.png",
      :alt => "Tasty onigiri",
      :caption => "This is a tasty miso onigiri."
    })
%>
```

Output:

```html
<figure class='post-media'>
  <a href='onigiri_full.png' title='View full sized image'>
    <img alt='Tasty onigiri' src='onigiri.png' />
  </a>
  <figcaption class="caption">
    This is a tasty miso onigiri.
  </figcaption>
</figure>
```

Output with omitted `:caption`:

```html
<figure class='post-media'>
  <a href='onigiri_full.png' title='View full sized image'>
    <img alt='Tasty onigiri' src='onigiri.png' />
  </a>
</figure>
```

### Blog post responsive image helper

Same as above, with instead of a plain `<img>` tag, this helpers output the
Picturefill markup. Accepts the same hash as the `picturefill_tag` helper, with
the addition of the optional `:caption`.

Usage:

```ruby
<%= post_responsive_image({
      :sizes => [
        { :src => "tuna_small.jpg", :media => "(max-width: 640px)" },
        { :src => "tuna_small@2x.jpg", :media => "(max-width: 640px) and (min-device-pixel-ratio: 1.5)" },
        { :src => "tuna_large.jpg", :media => "(min-width: 641px)", :canonical => true },
        { :src => "tuna_large@2x.jpg", :media => "(min-width: 641px) and (min-device-pixel-ratio: 1.5)" }
      ],
      :full => "tuna_full.jpg",
      :alt => "Tasty tuna sushi",
      :caption => "This is what a tasty tuna sushi looks like."
    })
%>
```

Output:

```html
<figure class='post-media'>
  <a href='tuna_full.jpg' title='View full sized image'>
    <div data-alt='Tasty tuna sushi' data-picture>
      <div data-media='(max-width: 640px)' data-src='tuna_small.jpg'> </div>
      <div data-media='(max-width: 640px) and (min-device-pixel-ratio: 1.5)' data-src='tuna_small@2x.jpg'> </div>
      <div data-media='(min-width: 641px)' data-src='tuna_large.jpg'> </div>
      <div data-media='(min-width: 641px) and (min-device-pixel-ratio: 1.5)' data-src='tuna_large@2x.jpg'> </div>
      <noscript>
        <img alt='Tasty tuna sushi' src='tuna_large.jpg' />
      </noscript>
    </div>
  </a>
  <figcaption class='caption'>
    This is what a tasty tuna sushi looks like.
  </figcaption>
</figure>
```

## License

Copyright (c) 2013 Eduardo Shiota Yasuda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
