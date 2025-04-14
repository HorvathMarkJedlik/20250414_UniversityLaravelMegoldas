<?php

namespace App\Http\Controllers;

use App\Models\Lector;
use App\Models\University;
use Illuminate\Http\Request;

class DataController extends Controller
{
    public function getAllUniversities(){
        $univiersities = University::orderBy('established_year', 'desc')->get();
        return response()->json($univiersities);
    }

    public function getStat(){

    }

    public function deleteLector($id){
        $lector = Lector::find($id);
        $lector->delete();
        return response()->json(['message' => 'A lektor törölve lett!']);
    }
}
