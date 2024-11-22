<?php
// Získání aktuální cesty z URL
$path = trim($_SERVER['REQUEST_URI'], '/');

// Definice přesměrování
$redirects = [
    'odkazy/tiktok' => 'https://www.tiktok.com/',
    'odkazy/instagram' => 'https://www.instagram.com/',
];

// Kontrola a přesměrování
if (array_key_exists($path, $redirects)) {
    header("Location: " . $redirects[$path]);
    exit;
} else {
    // Chyba, pokud není odkaz nalezen
    echo "<h1>404 - Stránka nenalezena</h1>";
    echo "<p>Neplatný odkaz. Vyzkoušejte: </p>";
    echo "<ul>";
    echo "<li><a href='/odkazy/tiktok'>TikTok</a></li>";
    echo "<li><a href='/odkazy/instagram'>Instagram</a></li>";
    echo "</ul>";
}
?>
