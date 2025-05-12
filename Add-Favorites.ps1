$favorites = @(
    @{Name = "Forritun"; URL = "http://www.forritun.is"},
    @{Name = "Kodun"; URL = "https://kodun.is"},
    @{Name = "Tskoli"; URL = "http://www.tskoli.is"}
)

foreach ($fav in $favorites) {
    $path = "$env:USERPROFILE\Favorites\$($fav.Name).url"
    Set-Content -Path $path -Value "[InternetShortcut]`nURL=$($fav.URL)" -Encoding ASCII
}
