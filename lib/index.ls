require! <[ cheerio exiv2 \mime-lookup \./util.js ]>
require! {
  path:{basename}
  util:promisify
}

debug = \metalsmith-galex |> require \debug

module.exports = (options) ->
  options.directory = util.nc options.directory, "#__dirname/img"
  gnames = [\Include \Explicit \Spoiler \Comment]
  if options.mimetypes
    mime = new mime-lookup require \mime-db
  (files, data, metalsmith) ->>
    for filn, data of files
      o=new Object!
      if options.mimetypes
        o.mimetype=mime.lookup filn
      id = basename filn .split \. [0]
      for i in readdir-sync options.directory + id, {+with-file-types}
        if i.is-directory!
          debug "Found directory #{dirent.name} in #id: skipping"
          continue
        try
          tags=await eft.load i.name
        catch
          debug "Could not load #{i.name}: \"#{e.name}: #{e.message}\", skipping"
          continue
        continue unless util.stob tags.Include
        #create subset and append it
        data.galex=util.pick gnames tags


