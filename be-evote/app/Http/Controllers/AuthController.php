<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use App\Models\Config;
use App\Models\User;
use App\Models\Users;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function show_login()
    {
        return view('auth.login');
    }
    public function show_register()
    {
        return view('auth.register', [
            'profile' => new User
        ]);
    }
    public function check_login(Request $request)
    {
        $credentials = $request->validate([
            'username' => ['required'],
            'password' => ['required', 'min:6'],
        ]);
        if ($request->login_as) {
            $att_error = 'Username';
            if (auth()->guard('admin')->attempt($credentials)) {
                $request->session()->regenerate();
                return redirect()->intended('/dashboard')->with('success', 'Login Success, Welcome!!');
            } else {
                return back()->with('error', $att_error . ' atau Password anda salah !!');
            }
        } else {
            $getUser = User::where('username', $credentials['username'])->first();
            $att_error = 'NIM ';
            if ($getUser) {
                if ($getUser['active'] == 0) {
                    return back()->with('error', 'Akun anda belum diaktifkan, Harap Hubungi Admin Untuk Mengaktifkan Akun !!');
                } else if (auth()->attempt($credentials)) {
                    $request->session()->regenerate();
                    return redirect()->intended('/')->with('success', 'Login Success, Welcome!!');
                } else {
                    return back()->with('error', $att_error . ' atau Password anda salah !!');
                }
            } else {
                return back()->with('error', 'Terdapat Kesalahan, Pastikan Data Yang Anda Inputkan Benar');
            }
        }
    }
    public function check_register(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|max:250',
            'username' => 'required|min:6|max:18|unique:users,username',
            'password' => 'required|min:6|max:100',
            'birth_date' => 'required',
            'prodi' => 'required',

        ]);
        $validated['password'] = bcrypt($request->password);
        $user = User::create($validated);
        if ($user) {
            // auth()->login($user);
            return redirect('/')->with('success', 'Berhasil Mendaftar, Selamat Datang ' . $request->name);
        }
    }
    public function logout(Request $request)
    {
        auth()->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/')->with('success', 'Logout Successfully');
    }
    public function logout_admin()
    {
        auth()->guard('admin')->logout();
        session()->flush();
        return redirect('/')->with('success', 'Logout Successfully');
    }

    public function get_user(Request $req){
        $osi = array();
        $statusCode = 200;

        try {
        //     $users_count = Users::where('name', '=', $req->username)
        //     ->where('password', '=', bcrypt($req->password))
        //     ->get()
        //     ->count();

        //     if ($users_count > 0 ){
        //         $users = Users::where('name', '=', $req->username)
        //         ->where('password', '=', bcrypt($req->password))
        //         ->get();

        //         $osi = array('message' => 'success',
        //                       'data' => $users);
        //     }else{
                
        // $statusCode = 500;
        //         $osi = array('message' => 'failed');
        //     }
            
            $credentials = $req->validate([
                'username' => ['required'],
                'password' => ['required', 'min:6'],
            ]);

            $messages = "";
            $data = "";

            $getUser = User::where('username', $credentials['username'])->first();
            $att_error = 'NIM ';
            if ($getUser) {
                if ($getUser['active'] == 0) {
                    //return back()->with('error', 'Akun anda belum diaktifkan, Harap Hubungi Admin Untuk Mengaktifkan Akun !!');
                    $messages = 'Akun belum Aktif';
                    $statusCode = 500;
                } else if (auth()->attempt($credentials)) {
                    // $req->session()->regenerate();
                    // return redirect()->intended('/')->with('success', 'Login Success, Welcome!!');
                    $messages = 'Success Login';
                    $data = $getUser;
                } else {
                    $messages = 'username atau Password anda salah !!';
                    $statusCode = 500;
                }
            }

                         $osi = array('message' => $messages,
                        'data' => $data);
          
          } catch (\Exception $e) {
          
            $osi = array('message' => $e->getMessage());
            $statusCode = 500;
          }

        return response()->json($osi)->setStatusCode($statusCode);

    }

    public function save_user(Request $req){
        $osi = array();
        $statusCode = 200;

        try {
            $users = new Users();
            $users->name = $req->name;
            $users->username = $req->username;
            $users->password = bcrypt($req->password);
            $users->birth_date = $req->birth_date;
            $users->prodi = $req->prodi;

            $users->save();
            
            $osi = array('message' => 'success');
          
          } catch (\Exception $e) {
          
            $osi = array('message' => $e->getMessage());
            $statusCode = 500;
          }

        return response()->json($osi)->setStatusCode($statusCode);

    }

    public function get_candidat_all(){
        $osi = array();
        $statusCode = 200;

        try {
            $candidates = Candidate::all();

            
            $osi = array('message' => 'success',
            'data' => $candidates);
          
          } catch (\Exception $e) {
          
            $osi = array('message' => $e->getMessage());
            $statusCode = 500;
          }

        return response()->json($osi)->setStatusCode($statusCode);

    }

    public function get_config(){
        $osi = array();
        $statusCode = 200;

        try {
            $config = Config::all()->get(0);

            
            $osi = array('message' => 'success',
            'data' => $config);
          
          } catch (\Exception $e) {
          
            $osi = array('message' => $e->getMessage());
            $statusCode = 500;
          }

        return response()->json($osi)->setStatusCode($statusCode);

    }

    public function get_candidat_result(){
        $osi = array();
        $statusCode = 200;

        try {

            $candidates = DB::table('votes')
    ->select('votes.candidate_id', DB::raw('count(*) as cnt, max(votes.user_id) as user_id, 
    max(candidates.nama_calon) as nama_calon, max(candidates.nama_wakil_calon) as nama_wakil_calon, max(candidates.foto) as foto'))
    // ->select('votes.user_id', 'votes.candidate_id', 'candidates.nama_calon', 'candidates.nama_wakil_calon')
    ->join('candidates', 'votes.candidate_id', '=', 'candidates.id')
    ->join('users', 'votes.user_id', '=', 'users.id')
    ->groupBy('votes.candidate_id')
    ->get();

            $voters = DB::table('votes')->get()->count();
            
            $ret = array('candidate_results' => $candidates,
            'sum_voters' => $voters);

            $osi = array('message' => 'success',
            'data' => $ret);
          
          } catch (\Exception $e) {
          
            $osi = array('message' => $e->getMessage());
            $statusCode = 500;
          }

        return response()->json($osi)->setStatusCode($statusCode);

    }

    public function save_vote(Request $req){
        $osi = array();
        $statusCode = 200;

        try {
            // protected $fillable = ['user_id','candidate_id','ip','os','browser'];
            $vote = new Vote();
            $vote->user_id = $req->user_id;
            $vote->candidate_id = $req->candidate_id;
            $vote->ip = $req->ip;
            $vote->os = $req->os;
            $vote->browser = $req->browser;

            $vote->save();
            
            $osi = array('message' => 'success');
          
          } catch (\Exception $e) {
          
            $osi = array('message' => $e->getMessage());
            $statusCode = 500;
          }

        return response()->json($osi)->setStatusCode($statusCode);

    }
}
