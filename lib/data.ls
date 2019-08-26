module.exports.defaults = {directory: \./img, -mimetypes}
module.exports.mdlware =
  name: \metalsmith-galex
  pattern: [\*]
  before: ->
    o=new Object!
    if options.mimetypes
      o.mimetype=mime.lookup filn
  each: (filn, data) ->>
    gnames = [\Include \Explicit \Spoiler \Comment]
    id = basename filn .split \. [0]
    for i in readdir-sync options.directory + id, {+with-file-types}
      if i.is-directory!
        debug "Found directory #{i.name} in #id: skipping"
        continue
      try
        tags=await eft.load i.name
      catch
        debug "Could not load #{i.name}: #{e.name}\: \"#{e.message}\", skipping"
        continue
      continue unless util.stob tags.Include
      #create subset and append it
      data.galex=util.pick gnames tags

