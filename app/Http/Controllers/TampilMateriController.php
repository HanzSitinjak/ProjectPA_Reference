<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TampilMateriController extends Controller
{
    public function index($nama_kelas)
    {
        // Jalankan stored procedure untuk mendapatkan data materi
        $materi = DB::select('CALL daftar_materi_kelas(?)',[$nama_kelas]); 

        // Kembalikan hasil sebagai respons JSON
        return response()->json($materi);
    }
}
