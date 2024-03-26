<?php

namespace App\Http\Controllers;

use App\Models\Kelas;
use Illuminate\Http\Request;

class KelasController extends Controller
{
    public function index()
    {
        return Kelas::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_kelas' => 'required|string|max:255'
        ]);

        return Kelas::create($request->all());
    }

    // Metode lainnya seperti show, update, destroy bisa ditambahkan sesuai kebutuhan
}
