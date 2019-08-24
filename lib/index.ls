require! <[ cheerio \mime-lookup \./util.js ]>
require! {
  path:{basename}
  'exiftool-vendored':exiftool
  fs:{readdir-sync}
}

debug = \metalsmith-galex |> require \debug

module.exports = (options) ->
  gnames = [\Include \Explicit \Spoiler \Comment]
  if typeof options is \undefined
    options = new Object!
    options.mimetypes = false
    options.directory = "#__dirname/img"
  if options.mimetypes
    mime = new mime-lookup require \mime-db
  #TODO: learn how to append to the metadata
  (files, metalsmith, cb) ->>
    for filn, data of files
      o=new Object!
      if options.mimetypes
        o.mimetype=mime.lookup filn
      id = basename filn .split \. [0]
      for i in readdir-sync options.directory + id, {+with-file-types}
        if i.is-directory!
          debug "Found directory #{i.name} in #id: skipping"
          continue
        try
          tags=await eft.load i.name
        catch
          debug "Could not load #{i.name}: \"#{e.name}: #{e.message}\", skipping"
          continue
        continue unless util.stob tags.Include
        #create subset and append it
        data.galex=util.pick gnames tags
        cb!


