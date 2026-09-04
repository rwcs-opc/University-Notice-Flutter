<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;

class TestMail extends Mailable
{
    public function build()
    {
        return $this
            ->subject('Laravel SMTP Test')
            ->text('emails.test');
    }
}