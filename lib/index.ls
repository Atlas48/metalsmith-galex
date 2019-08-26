require! <[ cheerio \mime-lookup ./util.js ./data.js ]>
require! {
  path:{basename}
  'exiftool-vendored':exiftool
  fs:{readdir-sync}
  'metalsmith-plugin-kit':pkit
}

debug = \metalsmith-galex |> require \debug

module.exports = (options) ->
  options = pkit.default-options data.defaults, options
  pkit.middleware data.mdlware
