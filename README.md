# contact_sheets
These two zsh scripts generate contact sheets for all of the jpeg images in one or more directories you supply as parameters.

They were designed to run as macOS Finder Quick Actions, but could be used in other forms of automation and on other platforms.

## Requirements
Both scripts rely on the [ImageMagick](https://imagemagick.org) tool. As there are multiple ways and therefore locations this can be installed, you may need to alter the path used in the scripts to suit. Each script contains only one invocation of the tool.

Note that ImageMagick and the `bc` tool are fully qualified to support use in automation tools that do not have your normal shell environment to operate in.

## Common features
You can pass as many directories as you wish as parameters to the scripts and each directory will be processed individually. See below for how to integrate them into Finder for easy use.

All contact sheets are created to an approximate 16:9 aspect ratio so that they make good use of a modern screen. If you generate, say, a 12x12 grid of images, the height of your screen will be a limiting factor when viewing. By displaying the same 144 images in a grid of 16x9 each thumbnail is larger on screen. All this is aimed at using QuickLook on macOS, which will generally try to fill the screen with the image.

Every image is rendered to fit in a 240 pixel square box, so it does not matter if you have lots of different aspect ratios. The grid will look sensible. However, very thin images, whether horizontal or vertical, may not be very legible. The scripts were built for cataloguing photographs.

Every image has its filename printed below it. This is in a fixed size font, so long filenames can get ugly. If this is problematic, you can alter the label characteristics. See [Annotating Images](https://imagemagick.org/Usage/annotating/).

## ccs.sh – single sheet per directory
My original script creates a single contact sheet per directory supplied. Because ImageMagick has to load all of the images into memory and composite them, this can run quite a while (minutes) for large numbers of images. I have had it successfully generate for a directory of over 1,400 images on a modest system configuration.

The contact sheet will be named the same as the directory and be placed at the same level as the directory. This means your directory MyDir and the contact sheet MyDir.jpg will appear together when sorted by name.

## ccsm.sh – multiple sheets per directory
This is a development of the original script above, which addresses the fact that a contact sheet of over 1,400 images leads to pretty small thumbnails when viewing the whole thing on screen!

It will divide up the list of images into blocks of 144, with an extra block containing the remainder. For example, a directory of 359 images will be split into two sheets of 144 images and one of 71 images. The first two will be laid out in a 16x9 grid. The latter will approximate this ratio with 11 columns and 7 rows, the last of which will only have 5 images.

The contact sheets for MyDir with 359 images will be called MyDir-01, MyDir-02, and MyDir-03 and will be placed at the same level as the directory.  This means your directory MyDir and all of the contact sheets MyDir-nn.jpg will appear together when sorted by name.
