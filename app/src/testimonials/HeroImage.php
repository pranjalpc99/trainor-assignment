<?php

namespace App\testimonials;

use SilverStripe\ORM\DataObject;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;

class HeroImage extends DataObject
{
    private static $table_name = 'HeroImage'; // Optional: Set a custom table name

    private static $db = [
        'Title' => 'Varchar(255)'
    ];

    private static $has_one = [
        'Image' => Image::class,
        'Testinomal' => \Testimonial::class, // Change this to your specific page class if not the default Page
    ];

    private static $owns = [
        'Image'
    ];

    private static $summary_fields = [
        'Title' => 'Title',
        'Thumbnail' => 'Thumbnail'
    ];

    public function getThumbnail()
    {
        return $this->Image()->CMSThumbnail();
    }

    public function getCMSFields()
    {
        return new FieldList(
            UploadField::create('Image', 'Hero Image')->setAllowedFileCategories('image/supported')->setFolderName('HeroImages'),
        );
    }
}