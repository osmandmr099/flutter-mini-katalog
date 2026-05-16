# Software Persona E-Commerce 🛍️

Flutter ile geliştirdiğim basit bir mobil katalog uygulaması. API entegrasyonu ile ürünleri listeleyebilir, detaylarını görüntüleyebilir ve sepete ekleyebilirsiniz. Sepet verileri uygulama kapatılsa dahi korunur.

---

## 📱 Ekran Görüntüleri

> *(Ekran görüntülerini buraya ekleyin)*

---

## ✨ Özellikler

- API ile ürün listeleme (GridView)
- Ürün arama ve filtreleme
- Ürün detay sayfası (açıklama, özellikler, fiyat)
- **Sepet yönetimi** — Sepete eklenen ürünler uygulama kapatılsa dahi korunur (SharedPreferences)
- Cache sistemi ile performans optimizasyonu
- Sayfa geçişleri (Navigator)

---

## 🛠️ Kullanılan Teknolojiler

- Flutter `3.41.9`
- Dart
- Material Design
- `shared_preferences: ^2.2.2`

---

## 📁 Proje Yapısı

```
lib/
├── main.dart
├── models/
│   └── product_model.dart
├── services/
│   ├── api_service.dart
│   └── cart_service.dart
├── components/
│   ├── product_card.dart
│   └── custom_card.dart
└── views/
    ├── home_screen.dart
    ├── product_detail_screen.dart
    └── cart_screen.dart
```

---

## 🚀 Çalıştırma Adımları

### Gereksinimler

- Flutter SDK `3.41.9`
- Dart SDK
- Android Studio / VS Code
- Android/iOS emulator veya fiziksel cihaz

### Kurulum

1. **Projeyi klonlayın:**
   ```bash
   git clone https://github.com/osmandmr099/software-persona-ecommerce.git
   cd software-persona-ecommerce
   ```

2. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get
   ```

3. **Flutter doctor ile ortamı kontrol edin:**
   ```bash
   flutter doctor
   ```

4. **Uygulamayı çalıştırın:**
   ```bash
   flutter run
   ```

> Çalıştırmadan önce emülatörün açık veya cihazın bağlı olduğundan emin olun.

### Build İşlemleri

**Android APK oluşturmak için:**
```bash
flutter build apk --release
```

**iOS için:**
```bash
flutter build ios --release
```

---

## 🌐 API Entegrasyonu

Ürün verileri `https://wantapi.com/products.php` adresinden çekilmektedir (eğitim/demo amaçlıdır). Cache sistemi sayesinde veriler 10 dakika boyunca yerel olarak saklanır, gereksiz API istekleri önlenir.

Alternatif test API'leri:
- [Fake Store API](https://fakestoreapi.com/products)
- [DummyJSON](https://dummyjson.com/products)

---

## 📚 Hakkında

Bu proje, 5 günlük Flutter eğitimi kapsamında geliştirdiğim ilk Flutter uygulamasıdır. Temel widget yapısı, sayfa geçişleri, API'den veri çekme ve SharedPreferences ile state yönetimi konularını kapsamaktadır.

## 📄 Lisans

Bu proje özel kullanım içindir.