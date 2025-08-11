CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `content_en` longtext,
  `content_ar` longtext,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `excerpt_ar` text,
  `excerpt_en` text,
  `category` varchar(100) DEFAULT NULL,
  `tags` text,
  `author` varchar(100) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'best-smartphones-2024','Best Smartphones of 2024','أفضل الهواتف الذكية لعام 2024','<p>As we move through 2024, the smartphone market continues to evolve with exciting new features and improvements. Here are our top picks for the best smartphones this year.</p><h2>Premium Flagship Phones</h2><p>The Samsung Galaxy S24 Ultra and iPhone 15 Pro Max lead the pack with their advanced cameras, powerful processors, and premium build quality.</p>','<p>مع تقدمنا خلال عام 2024، يستمر سوق الهواتف الذكية في التطور مع ميزات وتحسينات جديدة ومثيرة. إليكم أفضل اختياراتنا للهواتف الذكية هذا العام.</p><h2>الهواتف الرائدة المتميزة</h2><p>يتصدر سامسونج جالاكسي S24 الترا وآيفون 15 برو ماكس المجموعة بكاميراتهما المتقدمة ومعالجاتهما القوية وجودة البناء المتميزة.</p>','https://example.com/images/best-smartphones-2024.jpg','2025-08-10 09:56:23','2025-08-10 09:56:23',NULL,NULL,NULL,NULL,NULL,1),(2,'tv-buying-guide-2024','TV Buying Guide 2024','دليل شراء التلفزيون 2024','<p>Choosing the right TV can be overwhelming with so many options available. This comprehensive guide will help you make the best decision for your needs and budget.</p><h2>Display Technology</h2><p>OLED, QLED, and LED - understanding the differences between these technologies is crucial for making an informed purchase.</p>','<p>قد يكون اختيار التلفزيون المناسب أمرًا صعبًا مع وجود العديد من الخيارات المتاحة. سيساعدك هذا الدليل الشامل على اتخاذ أفضل قرار يناسب احتياجاتك وميزانيتك.</p><h2>تقنية العرض</h2><p>أوليد وكيو ليد وليد - فهم الاختلافات بين هذه التقنيات أمر بالغ الأهمية لاتخاذ قرار شراء مدروس.</p>','https://example.com/images/tv-buying-guide-2024.jpg','2025-08-10 09:56:23','2025-08-10 09:56:23',NULL,NULL,NULL,NULL,NULL,1);
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Samsung','samsung','https://example.com/logos/samsung.png'),(2,'Apple','apple','https://example.com/logos/apple.png'),(3,'LG','lg','https://example.com/logos/lg.png'),(4,'Sony','sony','https://example.com/logos/sony.png'),(5,'Huawei','huawei','https://example.com/logos/huawei.png'),(6,'Xiaomi','xiaomi','https://example.com/logos/xiaomi.png'),(7,'Dell','dell','https://example.com/logos/dell.png'),(8,'HP','hp','https://example.com/logos/hp.png'),(9,'Lenovo','lenovo','https://example.com/logos/lenovo.png'),(10,'Asus','asus','https://example.com/logos/asus.png');
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics','الإلكترونيات','electronics',NULL),(2,'Home Appliances','الأجهزة المنزلية','home-appliances',NULL),(3,'Computers & Laptops','الكمبيوترات والحاسوب المحمول','computers-laptops',NULL),(4,'Mobile Phones','الهواتف المحمولة','mobile-phones',1),(5,'Tablets','الأجهزة اللوحية','tablets',1),(6,'Televisions','أجهزة التلفزيون','televisions',1),(7,'Audio & Headphones','الصوتيات وسماعات الرأس','audio-headphones',1),(8,'Refrigerators','الثلاجات','refrigerators',2),(9,'Washing Machines','غسالات الملابس','washing-machines',2),(10,'Air Conditioners','مكيفات الهواء','air-conditioners',2),(11,'Laptops','الحاسوب المحمول','laptops',3),(12,'Desktop Computers','أجهزة الكمبيوتر المكتبية','desktop-computers',3),(13,'Gaming','الألعاب','gaming',3);
CREATE TABLE `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `flag` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','US Dollar','$','🇺🇸','United States'),(2,'EUR','Euro','€','🇪🇺','European Union'),(3,'GBP','British Pound','£','🇬🇧','United Kingdom'),(4,'JPY','Japanese Yen','¥','🇯🇵','Japan'),(5,'CNY','Chinese Yuan','¥','🇨🇳','China'),(6,'SAR','Saudi Riyal','ر.س','🇸🇦','Saudi Arabia'),(7,'AED','UAE Dirham','د.إ','🇦🇪','UAE'),(8,'EGP','Egyptian Pound','ج.م','🇪🇬','Egypt'),(9,'CAD','Canadian Dollar','C$','🇨🇦','Canada'),(10,'AUD','Australian Dollar','A$','🇦🇺','Australia'),(11,'INR','Indian Rupee','₹','🇮🇳','India'),(12,'BRL','Brazilian Real','R$','🇧🇷','Brazil'),(13,'RUB','Russian Ruble','₽','🇷🇺','Russia'),(14,'KRW','South Korean Won','₩','🇰🇷','South Korea'),(15,'TRY','Turkish Lira','₺','🇹🇷','Turkey');
CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `native_name` varchar(50) NOT NULL,
  `flag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','English','English','🇺🇸'),(2,'zh','Chinese','中文','🇨🇳'),(3,'hi','Hindi','हिन्दी','🇮🇳'),(4,'es','Spanish','Español','🇪🇸'),(5,'ar','Arabic','العربية','🇸🇦'),(6,'pt','Portuguese','Português','🇧🇷'),(7,'bn','Bengali','বাংলা','🇧🇩'),(8,'ru','Russian','Русский','🇷🇺'),(9,'ja','Japanese','日本語','🇯🇵'),(10,'fr','French','Français','🇫🇷'),(11,'de','German','Deutsch','🇩🇪'),(12,'ko','Korean','한국어','🇰🇷'),(13,'tr','Turkish','Türkçe','🇹🇷'),(14,'it','Italian','Italiano','🇮🇹'),(15,'vi','Vietnamese','Tiếng Việt','🇻🇳');
CREATE TABLE `pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `content_en` longtext,
  `content_ar` longtext,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_title_ar` varchar(255) DEFAULT NULL,
  `meta_title_en` varchar(255) DEFAULT NULL,
  `meta_description_ar` text,
  `meta_description_en` text,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(11,'privacy-policy','Privacy Policy','سياسة الخصوصية','<h1>Privacy Policy</h1>
<p>This privacy policy explains how we collect, use, and protect your personal information when you use our website.</p>
<h2>Information We Collect</h2>
<p>We collect information you provide directly to us, such as when you create an account, make a purchase, or contact us for support.</p>
<h2>How We Use Your Information</h2>
<p>We use the collected information to provide and improve our services, and send notifications about offers and updates.</p>
<h2>Data Protection</h2>
<p>We implement advanced security measures to protect your personal information, including encryption and continuous monitoring.</p>','<h1>سياسة الخصوصية</h1>
<p>تشرح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية معلوماتك الشخصية عند استخدام موقعنا الإلكتروني.</p>
<h2>المعلومات التي نجمعها</h2>
<p>نجمع المعلومات التي تقدمها لنا مباشرة، مثل عندما تنشئ حسابًا أو تقوم بعملية شراء أو تتصل بنا للحصول على الدعم.</p>
<h2>كيف نستخدم معلوماتك</h2>
<p>نستخدم المعلومات المجمعة لتقديم خدماتنا وتحسينها، وإرسال إشعارات حول العروض والتحديثات.</p>
<h2>حماية البيانات</h2>
<p>نتخذ تدابير أمنية متقدمة لحماية معلوماتك الشخصية، بما في ذلك التشفير والمراقبة المستمرة.</p>','2025-08-10 10:20:18','سياسة الخصوصية - CopRRA','Privacy Policy - CopRRA','تعرف على كيفية حماية خصوصيتك وبياناتك الشخصية في موقع CopRRA','Learn how we protect your privacy and personal data at CopRRA',1,'2025-08-10 10:20:18'),
(12,'terms-of-service','Terms of Service','شروط الاستخدام','<h1>Terms of Service</h1>
<p>Welcome to CopRRA, the leading price comparison platform. By using our website and services, you agree to comply with these terms of use.</p>
<h2>Acceptance of Terms</h2>
<p>By using the CopRRA website, you confirm that you are 18 years of age or older and have the legal capacity to enter into this agreement.</p>
<h2>Service Description</h2>
<p>CopRRA provides price comparison services for products from different stores, and displays product information and reviews.</p>
<h2>User Responsibilities</h2>
<p>As a user of our services, you agree to provide accurate information and maintain the confidentiality of your account data.</p>','<h1>شروط الاستخدام</h1>
<p>مرحباً بك في CopRRA، منصة مقارنة الأسعار الرائدة. باستخدامك لموقعنا وخدماتنا، فإنك توافق على الالتزام بشروط الاستخدام هذه.</p>
<h2>قبول الشروط</h2>
<p>باستخدام موقع CopRRA، فإنك تؤكد أنك تبلغ من العمر 18 عاماً أو أكثر وتمتلك الأهلية القانونية لإبرام هذه الاتفاقية.</p>
<h2>وصف الخدمات</h2>
<p>تقدم CopRRA خدمات مقارنة أسعار المنتجات من متاجر مختلفة، وعرض معلومات المنتجات والمراجعات.</p>
<h2>مسؤوليات المستخدم</h2>
<p>كمستخدم لخدماتنا، فإنك توافق على تقديم معلومات دقيقة والحفاظ على سرية بيانات حسابك.</p>','2025-08-10 10:20:18','شروط الاستخدام - CopRRA','Terms of Service - CopRRA','اقرأ شروط استخدام موقع CopRRA لمقارنة الأسعار','Read the terms of use for CopRRA price comparison website',1,'2025-08-10 10:20:18'),
(13,'about-us','About Us','من نحن','<h1>About Us</h1>
<p>CopRRA is the leading price comparison platform in the region, aimed at helping consumers find the best prices for the products they need.</p>
<h2>Our Vision</h2>
<p>To be the first price comparison platform in the region, and help consumers make informed purchasing decisions.</p>
<h2>Our Mission</h2>
<p>Provide comprehensive and accurate price comparison service, with useful product information to help customers make optimal choices.</p>
<h2>Our Values</h2>
<ul>
<li>Transparency in displaying prices and information</li>
<li>Accuracy in provided data</li>
<li>Ease of use</li>
<li>Excellent customer service</li>
</ul>','<h1>من نحن</h1>
<p>CopRRA هي منصة مقارنة الأسعار الرائدة في المنطقة، تهدف إلى مساعدة المستهلكين في العثور على أفضل الأسعار للمنتجات التي يحتاجونها.</p>
<h2>رؤيتنا</h2>
<p>أن نكون المنصة الأولى لمقارنة الأسعار في المنطقة، ونساعد المستهلكين في اتخاذ قرارات شراء مدروسة.</p>
<h2>مهمتنا</h2>
<p>تقديم خدمة مقارنة أسعار شاملة ودقيقة، مع توفير معلومات مفيدة حول المنتجات لمساعدة العملاء في الاختيار الأمثل.</p>
<h2>قيمنا</h2>
<ul>
<li>الشفافية في عرض الأسعار والمعلومات</li>
<li>الدقة في البيانات المقدمة</li>
<li>سهولة الاستخدام</li>
<li>خدمة العملاء المتميزة</li>
</ul>','2025-08-10 10:20:18','من نحن - CopRRA','About Us - CopRRA','تعرف على CopRRA ورؤيتنا في مقارنة الأسعار','Learn about CopRRA and our vision in price comparison',1,'2025-08-10 10:20:18'),
(14,'contact-us','Contact Us','اتصل بنا','<h1>Contact Us</h1>
<p>We are here to help you! Do not hesitate to contact us for any inquiries or suggestions.</p>
<h2>Contact Information</h2>
<p><strong>Email:</strong> info@coprra.com</p>
<p><strong>Phone:</strong> +966 11 123 4567</p>
<p><strong>Address:</strong> Riyadh, Saudi Arabia</p>
<h2>Working Hours</h2>
<p>Sunday - Thursday: 9:00 AM - 6:00 PM</p>
<p>Friday - Saturday: Closed</p>
<h2>Technical Support</h2>
<p>For technical support, please email us at: support@coprra.com</p>','<h1>اتصل بنا</h1>
<p>نحن هنا لمساعدتك! لا تتردد في التواصل معنا لأي استفسارات أو اقتراحات.</p>
<h2>معلومات الاتصال</h2>
<p><strong>البريد الإلكتروني:</strong> info@coprra.com</p>
<p><strong>الهاتف:</strong> +966 11 123 4567</p>
<p><strong>العنوان:</strong> الرياض، المملكة العربية السعودية</p>
<h2>ساعات العمل</h2>
<p>الأحد - الخميس: 9:00 صباحاً - 6:00 مساءً</p>
<p>الجمعة - السبت: مغلق</p>
<h2>الدعم الفني</h2>
<p>للدعم الفني، يرجى مراسلتنا على: support@coprra.com</p>','2025-08-10 10:20:18','اتصل بنا - CopRRA','Contact Us - CopRRA','تواصل مع فريق CopRRA للاستفسارات والدعم','Contact CopRRA team for inquiries and support',1,'2025-08-10 10:20:18'),
(15,'faq','FAQ','الأسئلة الشائعة','<h1>Frequently Asked Questions</h1>
<h2>What is CopRRA?</h2>
<p>CopRRA is a price comparison website that helps users find the best prices across multiple stores.</p>
<h2>How does CopRRA work?</h2>
<p>We gather product data from various sources and display them in an easy-to-compare format.</p>
<h2>Is CopRRA free to use?</h2>
<p>Yes, CopRRA is completely free for consumers to use.</p>
<h2>How often are prices updated?</h2>
<p>We update prices regularly to ensure you get the most current information available.</p>
<h2>Can I purchase directly through CopRRA?</h2>
<p>No, we redirect you to the retailer''s website where you can complete your purchase.</p>','<h1>الأسئلة الشائعة</h1>
<h2>ما هو CopRRA؟</h2>
<p>CopRRA هو موقع لمقارنة الأسعار يساعد المستخدمين في العثور على أفضل الأسعار عبر متاجر متعددة.</p>
<h2>كيف يعمل CopRRA؟</h2>
<p>نجمع بيانات المنتجات من مصادر متعددة ونعرضها بطريقة تسهل المقارنة بينها.</p>
<h2>هل استخدام CopRRA مجاني؟</h2>
<p>نعم، CopRRA مجاني تماماً للمستهلكين.</p>
<h2>كم مرة يتم تحديث الأسعار؟</h2>
<p>نقوم بتحديث الأسعار بانتظام لضمان حصولك على أحدث المعلومات المتاحة.</p>
<h2>هل يمكنني الشراء مباشرة من خلال CopRRA؟</h2>
<p>لا، نقوم بتوجيهك إلى موقع المتجر حيث يمكنك إكمال عملية الشراء.</p>','2025-08-10 10:20:18','الأسئلة الشائعة - CopRRA','FAQ - CopRRA','تعرف على الأسئلة الشائعة حول استخدام موقع CopRRA','Learn the most frequently asked questions about using CopRRA',1,'2025-08-10 10:20:18');



CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `verification_token` VARCHAR(255) NULL,
  `email_verified` BOOLEAN DEFAULT FALSE,
  `verified_at` TIMESTAMP NULL,
  `reset_token` VARCHAR(255) NULL,
  `reset_token_expires` TIMESTAMP NULL,
  `last_login` TIMESTAMP NULL,
  `is_active` BOOLEAN DEFAULT TRUE,
  `role` VARCHAR(50) DEFAULT 'user',
  `avatar_url` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `user_sessions` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `session_token` VARCHAR(255) NOT NULL UNIQUE,
  `expires_at` TIMESTAMP NOT NULL,
  `is_active` BOOLEAN DEFAULT TRUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `products` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name_en` VARCHAR(255) NOT NULL,
  `name_ar` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL UNIQUE,
  `description_en` LONGTEXT,
  `description_ar` LONGTEXT,
  `main_image_url` VARCHAR(255) NULL,
  `category_id` INT,
  `brand_id` INT,
  `price` DECIMAL(10, 2) NULL,
  `currency_code` VARCHAR(10) DEFAULT 'USD',
  `average_rating` DECIMAL(2, 1) DEFAULT 0.0,
  `total_reviews` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`brand_id`) REFERENCES `brands`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `product_specifications` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_id` INT NOT NULL,
  `spec_key_en` VARCHAR(255) NOT NULL,
  `spec_key_ar` VARCHAR(255) NOT NULL,
  `spec_value_en` TEXT,
  `spec_value_ar` TEXT,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `product_prices` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_id` INT NOT NULL,
  `store_name` VARCHAR(255) NOT NULL,
  `price` DECIMAL(10, 2) NOT NULL,
  `currency_code` VARCHAR(10) NOT NULL,
  `product_url` VARCHAR(2048) NOT NULL,
  `last_updated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`currency_code`) REFERENCES `currencies`(`code`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `product_images` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_id` INT NOT NULL,
  `image_url` VARCHAR(255) NOT NULL,
  `alt_text_en` VARCHAR(255) NULL,
  `alt_text_ar` VARCHAR(255) NULL,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `user_reviews` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `rating` INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  `title` VARCHAR(255) NOT NULL,
  `review_text` TEXT NOT NULL,
  `is_approved` BOOLEAN DEFAULT FALSE,
  `helpful_votes` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_verified_purchase` BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `product_qa` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `question` TEXT NOT NULL,
  `answer` TEXT NULL,
  `answered_by` INT NULL,
  `is_approved` BOOLEAN DEFAULT FALSE,
  `helpful_votes` INT DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `answered_at` TIMESTAMP NULL,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`answered_by`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


