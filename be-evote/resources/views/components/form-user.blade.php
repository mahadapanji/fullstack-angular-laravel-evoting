<div class="form-floating mb-3">
    <input type="number" class="form-control" id="username" name="username" placeholder="username" min="1"
        value="{{ old('username', $profile->username) }}" autofocus required autocomplete="off">
    <label for="username" id="label_username">NIM</label>
    @error('username')
        <div class="small text-danger py-1">{{ $message }}</div>
    @enderror
</div>
<div class="form-floating mb-3">
    <input type="text" class="form-control" id="name" name="name" placeholder="name"
        value="{{ old('name', $profile->name) }}" required autocomplete="off">
    <label for="name" id="label_name">Nama</label>
    @error('name')
        <div class="small text-danger py-1">{{ $message }}</div>
    @enderror
</div>
<div class="form-floating mb-3">
    <input type="password" class="form-control" id="password" name="password" placeholder="password"
        value="{{ old('password') }}" autocomplete="off">
    <label for="password">Password</label>
    @error('password')
        <div class="small text-danger py-1">{{ $message }}</div>
    @enderror
</div>
<div class="form-floating mb-3">
    <input type="date" class="form-control" id="birth_date" name="birth_date" min="1960-01-01" max="2004-01-01"
        value="{{ old('birth_date', $profile->birth_date) }}" required>
    <label for="birth_date" id="label_birth_date">Tanggal Lahir</label>
    @error('birth_date')
        <div class="small text-danger py-1">{{ $message }}</div>
    @enderror
</div>
<div class="form-floating mb-3">
    <select name="prodi" id="prodi" class="form-control" required>
        <option value="">Pilih Prodi</option>
        <option value="Sistem Informatika"
            {{ old('prodi', $profile->prodi) == 'Sistem Informatika' ? 'selected' : '' }}>Sistem Informatika
        </option>
        <option value="Teknik Informatika"
            {{ old('prodi', $profile->prodi) == 'Teknik Informatika' ? 'selected' : '' }}>Teknik Informatika
        </option>
    </select>
    <label for="prodi" id="label_prodi">Prodi</label>
    @error('prodi')
        <div class="small text-danger py-1">{{ $message }}</div>
    @enderror
</div>
