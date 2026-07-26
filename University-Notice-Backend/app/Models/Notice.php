<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Notice extends Model
{
   protected $fillable = [
    'title',
    'description',
    'department_id',
    'category_id',
    'priority',
    'pdf',
    'attachment',
    'publish_date',
    'expiry_date',
    'created_by',
    'image',
];

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}