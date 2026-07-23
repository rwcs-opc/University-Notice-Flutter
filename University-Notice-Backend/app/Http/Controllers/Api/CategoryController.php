<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    // Get All Categories
    public function index()
    {
        $categories = Category::all();

        return response()->json([
            'status' => true,
            'categories' => $categories
        ]);
    }

    // Create Category
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_name' => 'required|unique:categories,category_name',
            'description' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $category = Category::create([
            'category_name' => $request->category_name,
            'description' => $request->description,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Category Created Successfully',
            'category' => $category
        ], 201);
    }

    // Get Single Category
    public function show(string $id)
    {
        $category = Category::find($id);

        if (!$category) {
            return response()->json([
                'status' => false,
                'message' => 'Category Not Found'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'category' => $category
        ]);
    }

    // Update Category
    public function update(Request $request, string $id)
    {
        $category = Category::find($id);

        if (!$category) {
            return response()->json([
                'status' => false,
                'message' => 'Category Not Found'
            ], 404);
        }

        $category->update([
            'category_name' => $request->category_name,
            'description' => $request->description,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Category Updated Successfully',
            'category' => $category
        ]);
    }

    // Delete Category
    public function destroy(string $id)
    {
        $category = Category::find($id);

        if (!$category) {
            return response()->json([
                'status' => false,
                'message' => 'Category Not Found'
            ], 404);
        }

        $category->delete();

        return response()->json([
            'status' => true,
            'message' => 'Category Deleted Successfully'
        ]);
    }
}