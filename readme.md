metalsmith-galex
----------------

Metalsmith gallery extensions: XMP extension for creating a dataset linked to a page

Galex is also an XMP/XML namespace for catagorising and creating linked galleries in anything that needs such.

# Options
## Build
###`directory`

`string`, **default:** `"./img"`

Path to the galex gallery

###`mimetypes`

`boolean`, **default:** `false`

Option to include a `mimetype` field with the respective mimetype.

## Frontmatter
###`gallery`

`string` **default:** `basename(filename).split('.')[0]`

Overrides the path to the gallery directory

**Planned for future implementation**

#See Also

- [Definitions](./definitions.md)

