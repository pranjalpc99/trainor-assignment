<?php

namespace App;

use SilverStripe\CMS\Controllers\ContentController;

class TestimonialController extends ContentController
{
    private static $allowed_actions = [];

    public function index()
    {
        return $this->customise([])->renderWith(['Testimonial', 'Page']);
    }
}