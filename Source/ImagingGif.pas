{
  $Id$
  Vampyre Imaging Library
  by Marek Mauder 
  http://imaginglib.sourceforge.net

  The contents of this file are used with permission, subject to the Mozilla
  Public License Version 1.1 (the "License"); you may not use this file except
  in compliance with the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/MPL-1.1.html

  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
  the specific language governing rights and limitations under the License.

  Alternatively, the contents of this file may be used under the terms of the
  GNU Lesser General Public License (the  "LGPL License"), in which case the
  provisions of the LGPL License are applicable instead of those above.
  If you wish to allow use of your version of this file only under the terms
  of the LGPL License and not to allow others to use your version of this file
  under the MPL, indicate your decision by deleting  the provisions above and
  replace  them with the notice and other provisions required by the LGPL
  License.  If you do not delete the provisions above, a recipient may use
  your version of this file under either the MPL or the LGPL License.

  For more information about the LGPL: http://www.gnu.org/copyleft/lesser.html
}

{ This unit contains image format loader/saver for GIF images.}
unit ImagingGif;

{$I ImagingOptions.inc}

interface

uses
  SysUtils, Imaging, ImagingTypes, ImagingUtility;

type
  { GIF (Graphics Interchange Format) loader/saver class.}
  TGIFFileFormat = class(TImageFileFormat)
  protected
    function LoadData(Handle: TImagingHandle; var Images: TDynImageDataArray;
      OnlyFirstLevel: Boolean): Boolean; override;
    function SaveData(Handle: TImagingHandle; const Images: TDynImageDataArray;
      Index: LongInt): Boolean; override;
    procedure ConvertToSupported(var Image: TImageData;
      const Info: TImageFormatInfo); override;
  public
    constructor Create; override;
    function TestFormat(Handle: TImagingHandle): Boolean; override;
  end;

implementation

const
  SGIFFormatName = 'Graphics Interchange Format';
  SGIFMasks      = '*.gif';
  GIFSupportedFormats: TImageFormats = [ifR8G8B8];

type
  TGIFHeader = packed record
    // File header part
    Signature: TChar3;  // Header Signature (always "GIF")
    Version: TChar3;    // GIF format version("87a" or "89a")
    // Logical Screen Descriptor part
    ScreenWidth: Word;  // Width of Display Screen in Pixels
    ScreenHeight: Word; // Height of Display Screen in Pixels
    PackedFields: Byte; // Screen and color map information
    BackgroundColorIndex: Byte; // Background color index (in global color table)
    AspectRatio: Byte;  // Pixel aspect ratio, ratio = (AspectRatio + 15) / 64
  end;

{
  TGIFFileFormat implementation
}

constructor TGIFFileFormat.Create;
begin
  inherited Create;
  FName := SGIFFormatName;
  FCanLoad := True;
  FCanSave := True;
  FIsMultiImageFormat := True;
  FSupportedFormats := GIFSupportedFormats;

  AddMasks(SGIFMasks);
end;

function TGIFFileFormat.LoadData(Handle: TImagingHandle;
  var Images: TDynImageDataArray; OnlyFirstLevel: Boolean): Boolean;
begin

end;

function TGIFFileFormat.SaveData(Handle: TImagingHandle;
  const Images: TDynImageDataArray; Index: Integer): Boolean;
begin

end;

procedure TGIFFileFormat.ConvertToSupported(var Image: TImageData;
  const Info: TImageFormatInfo);
begin
  inherited;

end;

function TGIFFileFormat.TestFormat(Handle: TImagingHandle): Boolean;
begin

end;

initialization
//  RegisterImageFileFormat(TGIFFileFormat);

{
  File Notes:

 -- TODOS ----------------------------------------------------
    - nothing now
    - add some initial stuff!

  -- 0.23 Changes/Bug Fixes -----------------------------------
    - Unit created with initial stuff!
}

end.
