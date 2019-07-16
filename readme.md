# metalsmith-galex
Metalsmith gallery extensions: XMP extension for creating a dataset linked to a page

Galex is also an XMP/XML namespace for catagorising and creating linked galleries in anything that needs such.

#Default galex gallery directory structure

An example default galex directory would look like the following:

   ┬ src
   ├── entry1.md
   ├── entry2.md
   ├── entry3.md
   └─┬ img
     ├── entry1
     ├── apple.png
     ├── example.svg
     ├─┬ entry2
     │ ├── pony.jpg
     │ ├── trumpet.tiff
     │ └── lion.gif
     └─┬ entry3
       └── dancing.gif

The directory, `img` contains subdirectories with the same names as files located at the root

# Options
## Build
###`async`

`boolean`, **default:** `false`

**[UNIMPLEMENTED]** Puts `metalsmith-galex` into async mode, using asynchronous functions instead.

###`directory`

`string`, **default:** `"images"`

Path to the galex gallery

## Frontmatter
###`gallery`

`string` **default:** `basename(filename).split('.')[0]`

Path to the gallery directory

# The Galex Namespace

##Root Node: `galex`

- *Namespace:* `"http://atlasjan.sdf.org/xml/galex.rnc"`
- *Attributes:*
 - `extention:[text]`, **reserved** for defining future extensions
 - `version[xsd:decimal]`, the version used, usually `1.0`.
- *Sub-Nodes*
 - `explicit`
 - `include`
 - `spoiler`
 - `comment`

###Node: `explicit`

- *Type:* `xsd:boolean`
- *Description:* Marks the file as containing explicit or 'NSFW' content
- *Default If Not Specified:* `false`

###Node: `include`

- *Type:* `xsd:boolean`
- *Description:* Marks the file for inclusion in the gallery
- *Default If Not Specified:* `true`

###Node: `comment`

- *Type:* `xsd:boolean`
- *Description:* Marks the file as containing spoilers.
- *Default If Not Specified:* `false`

###Node: `comment`

- *Type:* `text`
- *Description:* Adds an associated comment to the file, can act as the Dublin Core's `dc:description` field.
- *Default If Not Specified:* ``

