<?php

use Page;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use App\testimonials\TestimonialObject;
use App\testimonials\QuoteObject;
use App\testimonials\HeroImage;
use SilverStripe\ORM\DB;

class Testimonial extends Page {

    private static $db = [
        'HeroSubhead' => 'Varchar(255)',
        'HeroHeadline' => 'Varchar(255)',
    ];

    private static $has_many = [
        'TestimonialObjects' => TestimonialObject::class, // Ensure this matches the class name correctly
        'QuoteObjects' => QuoteObject::class,
        'HeroImages' => HeroImage::class,
    ];

    public function getRandomHeroImage()
    {
        // Use a direct SQL query to fetch a random record
        $heroImageID = DB::query("SELECT ID FROM HeroImage WHERE TestinomalID = " . $this->ID . " ORDER BY RAND() LIMIT 1")->value();
        
        if ($heroImageID) {
            return HeroImage::get()->byID($heroImageID);
        }
        
        return null; // Return null if no images are found
    }

    public function getCMSFields() {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Hero', TextField::create('HeroSubhead', 'Subhead'));
        $fields->addFieldToTab('Root.Hero', TextField::create('HeroHeadline', 'Headline'));
        $fields->addFieldToTab('Root.Main', GridField::create(
            'TestimonialObjects',
            'Testimonials',
            $this->TestimonialObjects(),
            GridFieldConfig_RecordEditor::create()
        ));
        $fields->addFieldToTab('Root.Quote', GridField::create(
            'QuoteObjects',
            'Quotes',
            $this->QuoteObjects(),
            GridFieldConfig_RecordEditor::create()
        ));
        $fields->addFieldToTab('Root.HeroImages', GridField::create(
            'HeroImages',
            'Images',
            $this->HeroImages(),
            GridFieldConfig_RecordEditor::create()
        ));
        return $fields;
    }
}