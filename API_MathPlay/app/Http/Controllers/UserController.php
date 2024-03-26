<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::all();
        return response()->json($users, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nama' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'role' => 'required',
            'gender' => 'required',
            
        ]);
    
        $existingUser = User::where('email', $validatedData['email'])->first();
    
        if ($existingUser) {
            return response()->json(['message' => 'Data sudah ada'], 409);
        }
    
        $user = new User();
        $user->nama = $validatedData['nama'];
        $user->email = $validatedData['email'];
        $user->password = $validatedData['password'];
        $user->role = $validatedData['role'];
        $user->gender = $validatedData['gender'];
        $user->save();

        return response()->json(['message' => 'Berhasil menyimpan data'], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::findOrFail($id);
        return response()->json($user, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validatedData = $request->validate([
            'nama' => 'required',
            'email' => 'required|email|unique:users,email,'.$id,
        ]);

        $user = User::findOrFail($id);

        // Update atribut-atribut pengguna dari input permintaan
        $user->nama = $validatedData['nama'];
        $user->email = $validatedData['email'];

        $user->save();

        return response()->json($user, 200);
    }

    public function destroy(string $id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return response()->json(['message' => 'Pengguna deleted successfully', 201]);
    }
}
