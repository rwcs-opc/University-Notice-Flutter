<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Department;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DepartmentController extends Controller
{
    // Get All Departments
    public function index()
    {
        $departments = Department::all();

        return response()->json([
            'status' => true,
            'departments' => $departments
        ]);
    }

    // Create Department
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'department_name' => 'required|unique:departments,department_name',
            'description' => 'nullable|string'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $department = Department::create([
            'department_name' => $request->department_name,
            'description' => $request->description,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Department Created Successfully',
            'department' => $department
        ]);
    }

    // Get Single Department
    public function show(string $id)
    {
        $department = Department::find($id);

        if (!$department) {
            return response()->json([
                'status' => false,
                'message' => 'Department Not Found'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'department' => $department
        ]);
    }

    // Update Department
    public function update(Request $request, string $id)
    {
        $department = Department::find($id);

        if (!$department) {
            return response()->json([
                'status' => false,
                'message' => 'Department Not Found'
            ], 404);
        }

        $department->update([
            'department_name' => $request->department_name,
            'description' => $request->description,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Department Updated Successfully',
            'department' => $department
        ]);
    }

    // Delete Department
    public function destroy(string $id)
    {
        $department = Department::find($id);

        if (!$department) {
            return response()->json([
                'status' => false,
                'message' => 'Department Not Found'
            ], 404);
        }

        $department->delete();

        return response()->json([
            'status' => true,
            'message' => 'Department Deleted Successfully'
        ]);
    }
}