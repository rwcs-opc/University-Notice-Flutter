<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Notice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NoticeController extends Controller
{
    // Get All Notices
    public function index()
    {
        $notices = Notice::with(['department', 'category', 'user'])->get();

        return response()->json([
            'status' => true,
            'notices' => $notices
        ]);
    }

    // Create Notice
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'department_id' => 'required|exists:departments,id',
            'category_id' => 'required|exists:categories,id',
            'priority' => 'required|in:Normal,Important,Urgent',
            'publish_date' => 'required|date',
            'expiry_date' => 'nullable|date',
            'attachment' => 'nullable|string',
            'created_by' => 'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $notice = Notice::create($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Notice Created Successfully',
            'notice' => $notice
        ], 201);
    }

    // Get Single Notice
    public function show(string $id)
    {
        $notice = Notice::with(['department', 'category', 'user'])->find($id);

        if (!$notice) {
            return response()->json([
                'status' => false,
                'message' => 'Notice Not Found'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'notice' => $notice
        ]);
    }

    // Update Notice
    public function update(Request $request, string $id)
    {
        $notice = Notice::find($id);

        if (!$notice) {
            return response()->json([
                'status' => false,
                'message' => 'Notice Not Found'
            ], 404);
        }

        $notice->update($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Notice Updated Successfully',
            'notice' => $notice
        ]);
    }

    // Delete Notice
    public function destroy(string $id)
    {
        $notice = Notice::find($id);

        if (!$notice) {
            return response()->json([
                'status' => false,
                'message' => 'Notice Not Found'
            ], 404);
        }

        $notice->delete();

        return response()->json([
            'status' => true,
            'message' => 'Notice Deleted Successfully'
        ]);
    }
    public function category($category)
{
    $notices = Notice::with(['department', 'category'])
        ->whereHas('category', function ($query) use ($category) {
            $query->where('category_name', $category);
        })
        ->get();

    return response()->json([
        'status' => true,
        'notices' => $notices
    ]);
}
}