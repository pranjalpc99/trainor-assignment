<?php

namespace App\testimonials;

use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;

class TestimonialObject extends DataObject {

    private static $db = [
        'Title' => 'Text',
        'Description' => 'Text'
    ];

    private static $has_one = [
        'Testinomal' => \Testimonial::class, // Ensure this is correctly pointing to the Testinomal class
    ];
    
    // Define fields or other necessary code

    public function getCMSFields(){
        return new FieldList(
            TextField::create('Title'),
            TextareaField::create('Description'),
        );
    }
}