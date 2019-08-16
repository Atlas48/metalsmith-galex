require! <[ cheerio exiv2 ]>
require! {
  path:{basename}
  'klaw-sync':walk-sync
  fs:{readdir-sync}
  util:promisify
  'mime-lookup'
}

try
  require! chalk
catch
  chalk = null

if chalk
  console::err = (s) !-> @error chalk.red.bold(\ERR:) + s
  console::wrn = (s) !-> @error chalk.yellow.bold(\WRN:) + s
else
  console::err = (s) !-> @error "ERR: #s"
  console::wrn = (s) !-> @error "WRN: #s"

function stob (s)
  switch s
    | \False, \false => false
    | \True, \true   => true

module.exports = (options) ->
  options.directory = options.directory ? "#__dirname/img"
  if options.mimetypes
    mime = new mime-lookup require \mime-db
  (files, data, metalsmith) ->>
    for filn, data of files
     id = basename filn .split \. [0]
     for i in readdir-sync options.directory + id, with-file-types: true
       if i.is-directory!
         console.wrn "Found directory #{dirent.name} in #id: skipping"
         continue
       try
         tags=await eft.load i.name
       catch
         console.err "Could not load #{i.name}: \"#{e.name}: #{e.message}\", skipping"
         continue
      continue unless stob tags.Include

