<?php

namespace App\Helpers;

/**
 * Description of Helper
 *
 * @author Hendri
 */
class ImageHelper
{
	/**
	 * response
	 * [
	 *    'data' => base64encode,
	 *    'extension' => 'jpg' or 'png' or other
	 *    'type' => 'image/jpeg' or 'image/png' or other
	 * ]
	 *
	 * @param type $base64 - [data:image/png;base64,4AAQSkZJRgABAQAAAQABAAD]
	 * @return array
	 */
	public static function getImageBase64Information($base64)
	{
		if (!self::isImageBase64($base64)) {
			return false;
		}

		$splited = explode(',', substr($base64,5), 2);
		$mime = $splited[0]; // image type
		$data = $splited[1]; // data base64

		$mimeSplitWithoutBase64 = explode(';', $mime, 2);
		$type = $mimeSplitWithoutBase64[0];
		$mimeSplit = explode('/', $type, 2);

		$extension = null;
		if(count($mimeSplit) == 2) {
			$extension = $mimeSplit[1];
			if($extension == 'jpeg') $extension = 'jpg';
			//if($extension=='javascript')$extension='js';
			//if($extension=='text')$extension='txt';
		}

		return [
			'data' => $data,
			'extension' => $extension,
			'type' => $type,
		];
	}

	/**
	 * @param type $base64
	 * @return boolean
	 */
	public static function isImageBase64($base64) {
		if (preg_match('/^data:([a-zA-Z]+\/[a-zA-Z]+);base64\,([a-zA-Z0-9+\=\/]+)$/', $base64)) {
			return true;
		}

		return false;
	}

    public static function base64ToJpeg($base64_string, $output_file) {
        // open the output file for writing
        $ifp = fopen( $output_file, 'wb' );

        // split the string on commas
        // $data[ 0 ] == "data:image/png;base64"
        // $data[ 1 ] == <actual base64 string>
        $data = explode( ',', $base64_string );

        // we could add validation here with ensuring count( $data ) > 1
        fwrite( $ifp, base64_decode( $data[ 1 ] ) );

        // clean up the file resource
        fclose( $ifp );

        return $output_file;
    }
}
