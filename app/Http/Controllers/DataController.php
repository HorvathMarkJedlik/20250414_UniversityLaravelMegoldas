<?php

namespace App\Http\Controllers;

use App\Models\Lector;
use Illuminate\Http\Request;

class DataController extends Controller
{
    public function getAllUniversities(){

    }

    public function getStat(){

    }

    public function deleteLector($id){
        $lector = Lector::find($id);
        $lector->delete();
        return response()->json(['message' => 'A lektor törölve lett!']);
    }
}
