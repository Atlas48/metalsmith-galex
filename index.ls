require! <[ cheerio imagemagick /* gm */ ]>
require! {
  path:{basename}
  'klaw-sync':walk-sync
  fs:{readdir-sync}
  util:promisify
}

imk = promisify imagemagick
#TODO: work out how to use imagemagick to get galex data

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

function nc (x, y)
  if typeof x isnt \undefined and x isnt null then x
  else y

module.exports = (options) ->
  options.directory = nc options.directory, \img
  (files, data, metalsmith) ->>
    for filn, data of files
     id = basename filn .split \. [0]
     for i in readdir-sync options.directory + id, with-file-types: true
       if i.is-directory!
         console.wrn "Found #{dirent.name} in #id: skipping"
         continue
       #TODO: rest of the code
       try
         tags=await eft.load i.name
       catch
         console.err "could not load #{i.name}: \"#{e.name}: #{e.message}\""

