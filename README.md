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

## Deployment process

Props to @lucasmazza on the deployment process config and README

First, be sure to have your production credentials for AWS available
on your environment, either using [awsenv](https://github.com/mv/awsenv)
or exporting then by yourself.

```
export AWS_ACCESS_KEY_ID=<your access key>
export AWS_SECRET_ACCESS_KEY=<your secret key>
```

Uncomment and insert your fog directory on `config.rb`

```
sync.fog_directory = "YOUR_FOG_DIRECTORY"
```

Then, build a fresh version of the website with `middleman build`
(so you won't upload an outdated version of the website) and upload
the build output with `middleman sync`.

```
# Build the static site into `./build`.
middleman build
# Upload everything in `./build` to S3.
middleman sync
```

## License

Copyright (c) 2013 Eduardo Shiota Yasuda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
