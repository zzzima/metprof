<?php
Class Img{

function img_test(){
    $a=100;
    return $a;
}

/*
function handleImage($src_path,$out_path,$out_name){
	global $images,$img;

	$path_info = pathinfo($src_path);
	if ($path_info['extension'] == "jpg"){

		$out_h=300;
		$out_w=300;

		$out_im = imagecreatetruecolor($out_w,$out_h) or die('Cannot create pattern image');
		imagefill($out_im, 0, 0, 0xFFFFFF);

		$src_im = imageCreateFromJPEG($src_path);
		$src_w = imageSX($src_im);
		$src_w = imageSY($src_im);	

    		imagecopyresampled($out_im,$src_im,0,0,0,0,$out_w,$out_h,$src_w,$src_h);		

		Header("Content-type: image/jpg");
		imageJPEG($out_im,$out_path.$out_name.".jpg");
		imagedestroy($src_im);
		imagedestroy($out_im);
	}
}
*/

function imageresize($outfile,$infile,$neww,$newh,$quality) {
	$path_info = pathinfo($infile);
	if ($path_info['extension'] == "jpg"){

	    $im=imagecreatefromjpeg($infile);
	    $k1=$neww/imagesx($im);
	    $k2=$newh/imagesy($im);
	    $k=$k1>$k2?$k2:$k1;

	    $w=intval(imagesx($im)*$k);
	    $h=intval(imagesy($im)*$k);

	    //$im1=imagecreatetruecolor($w,$h);
	    $im1=imagecreatetruecolor($neww,$newh);
	    imagefill($im1, 0, 0, 0xFFFFFF);

	    $pos_x = intval(($neww - $w)/2);
	    $pos_y = intval(($newh - $h)/2);

	    imagecopyresampled($im1,$im,$pos_x,$pos_y,0,0,$w,$h,imagesx($im),imagesy($im));

	    imagejpeg($im1,$outfile,$quality);
	    imagedestroy($im);
	    imagedestroy($im1);
	}
}

//newest
function image_resize(
    $source_path, 
    $destination_path, 
    $newwidth,
    $newheight = FALSE, 
    $quality = 100 // качество для формата jpeg
    ) {

    //var_dump($source_path,$destination_path);
    ini_set("gd.jpeg_ignore_warning", 1); // иначе на некотоых jpeg-файлах не работает
    
    list($oldwidth, $oldheight, $type) = getimagesize($source_path);
    
    switch ($type) {
        case IMAGETYPE_JPEG: $typestr = 'jpeg'; break;
        case IMAGETYPE_GIF: $typestr = 'gif' ;break;
        case IMAGETYPE_PNG: $typestr = 'png'; break;
    }
    $function = "imagecreatefrom$typestr";
    $src_resource = $function($source_path);
    
    if (!$newheight) { $newheight = round($newwidth * $oldheight/$oldwidth); }
    elseif (!$newwidth) { $newwidth = round($newheight * $oldwidth/$oldheight); }
    $destination_resource = imagecreatetruecolor($newwidth,$newheight);
    
    imagecopyresampled($destination_resource, $src_resource, 0, 0, 0, 0, $newwidth, $newheight, $oldwidth, $oldheight);
    
    if ($type == 2) { # jpeg
        imageinterlace($destination_resource, 1); // чересстрочное формирование изображение
        imagejpeg($destination_resource, $destination_path, $quality);      
    }
    else { # gif, png
        $function = "image$typestr";
        $function($destination_resource, $destination_path);
    }
    
    imagedestroy($destination_resource);
    imagedestroy($src_resource);
}

/*
function draw_pattern($cell,$pW,$pH,$matrix,$hexset,$path,$out_fname){
	global $images,$img;

	$imgH = $cell*$pH;
	$imgW = $cell*$pW;

	$image = imagecreatetruecolor($imgW,$imgH) or die('Cannot create pattern image');

// fill background of image with white color
	imagefill($image, 0, 0, 0xFFFFFF);

        $border=0xCCCCCC;
	$sideX = $sideY = $cell;

	for($i=0;$i<$pH;$i++){
		$topX=0;
		$topY = $i*$cell; 
		for($j=0;$j<$pW;$j++){
			$topX = $j*$cell;
			$key = $matrix[$i][$j];
			$c_rgb= $img->Hex2RGB($hexset[$key]);
			$color = imagecolorallocate($image, $c_rgb[0], $c_rgb[1], $c_rgb[2]);;
			$img->draw_square($image, $topX, $topY, $sideX, $sideY, $color, $border);
		}
	}

	header('Content-type: image/png');
	imagepng($image,$path.$out_fname.".png");
	imagedestroy($image);
}

function spread_pattern($repeat,$path,$in_fname,$out_fname){
	global $images,$img,$config;
	$src_im = imageCreateFromPNG($path.$in_fname.".png");

	$ipW = imageSX($src_im);
	$ipH = imageSY($src_im);

//	$needW = $config["spread"];
	$outW = $ipW*$repeat;

	$dst_im = imagecreatetruecolor($outW,$ipH);
	$dst_x=0;	
	for($i=1;$i<=$repeat;$i++){
		imageCopy($dst_im,$src_im,$dst_x,0,0,0,$ipW,$ipH);
		$dst_x = $dst_x + $ipW;
	}

	Header("Content-type: image/png");
	imagePNG($dst_im,$path.$out_fname.".png");
	imagedestroy($src_im);
	imagedestroy($dst_im);
}
*/
/*
function imageresize($dst_im,$src_im,$neww,$newh) {
	global $images,$img,$config;

    	$im0=imagecreatefrompng($src_im);

	$oldw = imagesx($im0);
	$oldh = imagesy($im0);
	if ($newh == 0){
		$ratio = $neww*100/$oldw;
		$newh = $oldh*$ratio/100;		
	}
	if ($neww == 0){
		$ratio = $newh*100/$oldh;
		$neww = $oldw*$ratio/100;		
	}

	print $ratio.":  ".$neww." x ".$newh;
    	$im1=imagecreatetruecolor($neww,$newh);
    	imagecopyresampled($im1,$im0,0,0,0,0,$neww,$newh,$oldw,$oldh);

    	imagepng($im1,$dst_im);

    	imagedestroy($im0);
    	imagedestroy($im1);
}
*/

}
?>