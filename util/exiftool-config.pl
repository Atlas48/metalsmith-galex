%Image::ExifTool::UserDefined::galex = (
    GROUPS => { 0 => 'XMP', 1 => 'XMP-galex', 2 => 'Image' },
    NAMESPACE => { 'galex' => 'http://atlasjan.sdf.org/xml/galex.xsd' },
    WRITABLE => 'string', # (default to string-type tags)
    # Example 8.  XMP-galex:NewXMPgalexTag1 (an alternate-language tag)
    # - replace "NewXMPgalexTag1" with your own tag name (eg. "MyTag")
    Include => { Writable => 'boolean' },
    Explicit => { Writable => 'boolean' },
    Spoiler => { Writable => 'boolean' },
    Comment => { Writable => 'string' },
    # Each field in the structure has a corresponding flattened tag that is
    # generated automatically with an ID made from a concatenation of the
    # original structure tag ID and the field name (after capitalizing the
    # first letter of the field name if necessary).  The Name and/or
    # Description of these flattened tags may be changed if desired, but all
    # other tag properties are taken from the structure field definition.
    # The "Flat" flag must be used when setting the Name or Description of a
    # flattened tag.  For example:
    NewXMPxxxStructX => { Name => 'SomeOtherName', Flat => 1 },
);
