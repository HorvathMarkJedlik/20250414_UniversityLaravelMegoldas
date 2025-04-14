<?php

namespace App\Http\Controllers;

use App\Models\Lector;
use App\Models\University;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DataController extends Controller
{
    function getAllUniversities(){
        $univiersities = University::with('current_lector')->orderBy('established_year', 'desc')->get();

        $index = 1;
        foreach($univiersities as $university){
            $university['index'] = $index . ".";
            $index++;
        }
        return response()->json($univiersities);

    }

    public function getStat(){
        $stat = DB::table('universities')
        ->join('lectors', 'universities._id', '=', 'lectors.university_id')
        ->groupBy('universities.name')
        ->selectRaw('universities.name, count(*) as lectors_count')
        ->get();

        return response()->json($stat);
    }

    public function deleteLector($id){
        $lector = Lector::find($id);

        if(!$lector){
            return response()->json(['message' => 'A megadott azonosítóval nem létezik lektor'], 404);
        }

        if($lector->current_university){
            return response()->json(['message' => 'A lektor nem törölhető mert '.$lector->current_university->name.' aktuális lektora'], 403);
        }

        $lector->delete();
        return response()->json(['message' => 'A lektor törölve lett!']);
    }
}
