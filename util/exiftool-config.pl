%Image::ExifTool::UserDefined = (
  'Image::ExifTool::XMP::Main' => {
    galex => { SubDirectory => { TagTable => 'Image::ExifTool::UserDefined::galex' }}
  }
);

%Image::ExifTool::UserDefined::galex = (
    GROUPS => { 0 => 'XMP', 1 => 'XMP-galex', 2 => 'Image' },
    NAMESPACE => { 'galex' => 'http://atlasjan.sdf.org/xml/galex.xsd' },
    WRITABLE => 'string', # default to string-type tags
    Include => { Writable => 'boolean' },
    Explicit => { Writable => 'boolean' },
    Spoiler => { Writable => 'boolean' },
    Comment => { Writable => 'string' },
);
