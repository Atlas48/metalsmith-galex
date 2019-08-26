module.exports.defaults = {directory: \./img, -mimetypes}
module.exports.mdlware =
  name: \metalsmith-galex
  pattern: [\*]
  each: (filn, data) ->>
    gnames = [\Include \Explicit \Spoiler \Comment]
    id = basename filn .split \. [0]
    data.galex=new Array!
    if options.mimetypes then o.mimetype=mime.lookup filn
    for i in readdir-sync options.directory + id, {+with-file-types}
      o=new Object!
      if i.is-directory!
        debug "Found directory #{i.name} in #id: skipping"
        continue
      case i.name.split \. [0]
        | \png,\jpg,\tiff
          try
            tags=await eft.load i.name
          catch
            debug "Could not load #{i.name}: #{e.name}\: \"#{e.message}\", skipping"
            continue
          continue unless util.stob tags.Include
          #create subset and append it
          data.galex.push util.pick gnames, tags
        | \svg
          $ = cheerio.load i.name
          $ \galex .each ->
            j=$ @
            if j.tagName is gnames[3]
              o[j.tagName]=j.text!
            else
              o[j.tagName]=util.stob j.text!
        | _ => debug "No idea what to do with #{i.name}, skipping"



