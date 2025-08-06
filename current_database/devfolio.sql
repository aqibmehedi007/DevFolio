-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table devfolio.activations
CREATE TABLE IF NOT EXISTS `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.activations: ~0 rows (approximately)
INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'fURwdWqBBPxszdXPCRmaLvK2PPb6Dum0', 1, '2025-06-25 17:23:16', '2025-06-25 17:23:16', '2025-06-25 17:23:16');

-- Dumping structure for table devfolio.admin_notifications
CREATE TABLE IF NOT EXISTS `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.admin_notifications: ~0 rows (approximately)

-- Dumping structure for table devfolio.announcements
CREATE TABLE IF NOT EXISTS `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT '0',
  `dismissible` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.announcements: ~0 rows (approximately)

-- Dumping structure for table devfolio.announcements_translations
CREATE TABLE IF NOT EXISTS `announcements_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcements_id` bigint unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`announcements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.announcements_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.audit_histories
CREATE TABLE IF NOT EXISTS `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.audit_histories: ~0 rows (approximately)
INSERT INTO `audit_histories` (`id`, `user_id`, `user_type`, `module`, `request`, `action`, `user_agent`, `ip_address`, `actor_id`, `actor_type`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Botble\\ACL\\Models\\User', 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '127.0.0.1', 1, 'Botble\\ACL\\Models\\User', 1, 'Aqib Mehedi', 'info', '2025-08-02 21:56:18', '2025-08-02 21:56:18');

-- Dumping structure for table devfolio.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.cache: ~0 rows (approximately)

-- Dumping structure for table devfolio.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.cache_locks: ~0 rows (approximately)

-- Dumping structure for table devfolio.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.categories: ~9 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
	(1, 'Web Development', 0, 'Autem laudantium consequatur et provident. Est voluptatem dolorem in sint est reprehenderit possimus aut. Officiis at sunt maxime recusandae tenetur omnis error. Sed natus adipisci velit laboriosam.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(2, 'Open Source Contributions', 0, 'Saepe voluptatem dolorum ipsa qui eum beatae qui. Possimus repellat nisi esse iste consectetur sit. Similique velit est pariatur labore. A et nam nostrum placeat debitis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(3, 'Tutorials', 0, 'Beatae temporibus soluta aut sint cupiditate nobis. Earum incidunt aperiam debitis magnam quas. Nihil quasi quos ut quos harum quia. Quaerat molestiae velit neque fugit at unde eum.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(4, 'Technology Reviews', 0, 'Quia neque ea dignissimos ut ea aut. Molestiae est ut quo sed nemo tempore.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(5, 'Personal Blog', 0, 'Neque excepturi ad nam laborum quia totam maxime labore. Ducimus repellendus atque hic quia. Iste et nostrum eaque explicabo. Aliquid occaecati voluptatem tempora nesciunt et.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(6, 'Career Journey', 0, 'Non quibusdam optio ut quae nihil. Quasi dolorem a quae quo esse corporis. Eaque voluptas quia harum perferendis repudiandae consectetur. Repellat ab vitae sit voluptatum qui qui.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(7, 'Coding Challenges', 0, 'Quia ipsa voluptatem commodi deleniti eum assumenda. Earum necessitatibus sint veniam quidem rerum. Ut non occaecati molestias aspernatur porro voluptate eligendi est.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(8, 'Design Portfolio', 0, 'Saepe assumenda earum nisi voluptatem exercitationem nesciunt accusantium pariatur. Fugit doloribus temporibus delectus facilis. Necessitatibus quidem eum nemo numquam. Omnis qui dolor qui animi.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(9, 'Collaborations', 0, 'Sed tempore aut mollitia perspiciatis quibusdam qui. Cumque non est minus quaerat error. Ut et tenetur nobis ipsum ullam nisi. Ab eum dolorem voluptatum quod quisquam expedita ab.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2025-06-25 17:23:17', '2025-06-25 17:23:17');

-- Dumping structure for table devfolio.categories_translations
CREATE TABLE IF NOT EXISTS `categories_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.categories_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.contacts: ~0 rows (approximately)

-- Dumping structure for table devfolio.contact_custom_fields
CREATE TABLE IF NOT EXISTS `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.contact_custom_fields: ~0 rows (approximately)

-- Dumping structure for table devfolio.contact_custom_fields_translations
CREATE TABLE IF NOT EXISTS `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.contact_custom_fields_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.contact_custom_field_options
CREATE TABLE IF NOT EXISTS `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.contact_custom_field_options: ~0 rows (approximately)

-- Dumping structure for table devfolio.contact_custom_field_options_translations
CREATE TABLE IF NOT EXISTS `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.contact_custom_field_options_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.contact_replies
CREATE TABLE IF NOT EXISTS `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.contact_replies: ~0 rows (approximately)

-- Dumping structure for table devfolio.dashboard_widgets
CREATE TABLE IF NOT EXISTS `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.dashboard_widgets: ~7 rows (approximately)
INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'widget_total_themes', '2025-08-02 21:56:36', '2025-08-02 21:56:36'),
	(2, 'widget_total_users', '2025-08-02 21:56:36', '2025-08-02 21:56:36'),
	(3, 'widget_total_plugins', '2025-08-02 21:56:36', '2025-08-02 21:56:36'),
	(4, 'widget_total_pages', '2025-08-02 21:56:36', '2025-08-02 21:56:36'),
	(5, 'widget_posts_recent', '2025-08-02 21:56:36', '2025-08-02 21:56:36'),
	(6, 'widget_audit_logs', '2025-08-02 21:56:37', '2025-08-02 21:56:37'),
	(7, 'widget_request_errors', '2025-08-02 21:56:37', '2025-08-02 21:56:37');

-- Dumping structure for table devfolio.dashboard_widget_settings
CREATE TABLE IF NOT EXISTS `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.dashboard_widget_settings: ~0 rows (approximately)

-- Dumping structure for table devfolio.device_tokens
CREATE TABLE IF NOT EXISTS `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.device_tokens: ~0 rows (approximately)

-- Dumping structure for table devfolio.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table devfolio.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.faqs: ~18 rows (approximately)
INSERT INTO `faqs` (`id`, `question`, `answer`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'What is business consulting?', 'Business consulting involves providing expert advice to organizations to help them improve their performance and achieve their business objectives.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(2, 'How can consulting services benefit my business?', 'Consulting services can provide insights, strategies, and solutions to address specific challenges, improve efficiency, enhance decision-making, and ultimately contribute to the overall success of your business.', 1, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(3, 'What specific services do you provide?', 'We offer a range of services, including strategic planning, financial advisory, operations optimization, market research, and more. Our goal is to tailor our services to meet the unique needs of each client.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(4, 'How do you structure your fees?', 'Our fees are structured based on the scope and complexity of the project. We offer different pricing models, including hourly rates, project-based fees, and retainer agreements. The specific fee structure will be discussed and agreed upon during the initial consultation.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(5, 'What industries do you specialize in?', 'We have experience and expertise across various industries, including but not limited to technology, finance, healthcare, and manufacturing. Our consultants work closely with clients to understand industry-specific challenges and provide tailored solutions.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(6, 'Can you share any client testimonials or case studies?', 'Certainly! We have a collection of client testimonials and case studies that highlight the success stories of our consulting engagements. Please visit our \'Client Success Stories\' section for more details.', 2, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(7, 'How do you collaborate with clients during the consulting process?', 'We believe in a collaborative approach. Throughout the consulting process, we maintain open communication with our clients, involve key stakeholders, and ensure that the client\'s perspective is integral to the decision-making process.', 1, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(8, 'How long does a typical consulting engagement last?', 'The duration of a consulting engagement varies depending on the nature and scope of the project. During the initial consultation, we work with clients to define the timeline and milestones for the project, ensuring alignment with their goals and objectives.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(9, 'Who are the key members of your consulting team?', 'Our consulting team consists of highly qualified and experienced professionals with diverse backgrounds. You can learn more about our team members on the \'Meet the Team\' page of our website.', 1, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(10, 'How do you handle client information and sensitive data?', 'We take data privacy and confidentiality seriously. Our firm adheres to strict security protocols to protect client information. We have established measures to ensure the confidentiality and security of sensitive data throughout the consulting process.', 1, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(11, 'Is there ongoing support after the consulting engagement?', 'Yes, we provide ongoing support to our clients even after the completion of the consulting engagement. This may include follow-up meetings, additional training, and assistance with the implementation of recommended strategies to ensure sustained success.', 1, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(12, 'What is your policy regarding cancellations?', 'Our cancellation policy is outlined in the consulting agreement. Generally, we require advance notice for cancellations, and any associated fees or refunds will be discussed and agreed upon during the initial engagement negotiations.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(13, 'What is your approach to sustainability consulting?', 'In sustainability consulting, we work with clients to develop environmentally responsible and socially conscious business practices. Our approach involves assessing current operations, identifying areas for improvement, and implementing sustainable strategies to reduce environmental impact and promote corporate social responsibility.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(14, 'Do you offer remote consulting services?', 'Yes, we offer remote consulting services to clients worldwide. Our team is equipped to conduct virtual meetings, collaborate online, and deliver effective consulting services remotely. This allows us to work with clients regardless of geographical location.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(15, 'How can your technology integration services benefit my business?', 'Our technology integration services focus on streamlining business processes through the effective use of technology. By integrating the right technologies, we help businesses enhance efficiency, improve communication, and stay competitive in today\'s rapidly evolving digital landscape.', 2, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(16, 'What sets your leadership development programs apart?', 'Our leadership development programs are designed to empower individuals at all levels of an organization. We go beyond traditional training, focusing on personalized coaching, mentorship, and experiential learning to cultivate effective and inspiring leaders within your company.', 2, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(17, 'How do you stay updated on industry trends and best practices?', 'We are committed to staying at the forefront of industry trends and best practices. Our team actively engages in continuous learning, participates in relevant conferences, and maintains a strong network of industry professionals to ensure that our consulting services are informed by the latest insights and innovations.', 2, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(18, 'What measures do you take to ensure the quality of your consulting services?', 'We prioritize the quality of our consulting services by implementing rigorous quality assurance processes. This includes regular reviews of our methodologies, ongoing training for our consultants, and soliciting feedback from clients to continuously improve our service delivery.', 3, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18');

-- Dumping structure for table devfolio.faqs_translations
CREATE TABLE IF NOT EXISTS `faqs_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.faqs_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.faq_categories
CREATE TABLE IF NOT EXISTS `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.faq_categories: ~3 rows (approximately)
INSERT INTO `faq_categories` (`id`, `name`, `order`, `status`, `created_at`, `updated_at`, `description`) VALUES
	(1, 'Service Offerings', 0, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL),
	(2, 'Cost and Billing', 1, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL),
	(3, 'Follow-Up Support', 2, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL);

-- Dumping structure for table devfolio.faq_categories_translations
CREATE TABLE IF NOT EXISTS `faq_categories_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.faq_categories_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.fob_comments
CREATE TABLE IF NOT EXISTS `fob_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reply_to` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fob_comments_author_type_author_id_index` (`author_type`,`author_id`),
  KEY `fob_comments_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `fob_comments_reply_to_index` (`reply_to`),
  KEY `fob_comments_reference_url_index` (`reference_url`),
  KEY `fob_comments_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.fob_comments: ~47 rows (approximately)
INSERT INTO `fob_comments` (`id`, `reply_to`, `author_type`, `author_id`, `reference_type`, `reference_id`, `reference_url`, `name`, `email`, `website`, `content`, `status`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
	(1, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 5, 'http://zelio.test', 'Elwin Runolfsdottir', 'darrick91@hotmail.com', 'https://friendsofbotble.com', 'This is really helpful, thank you!', 'approved', '84.154.41.119', 'Mozilla/5.0 (Windows 98; Win 9x 4.90) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/99.0.4286.20 Safari/535.1 Edg/99.01014.35', '2025-06-13 11:56:10', '2025-06-25 17:23:21'),
	(2, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 6, 'http://zelio.test', 'Jennifer Legros', 'christiansen.roma@larson.biz', 'https://friendsofbotble.com', 'I found this article to be quite informative.', 'approved', '157.167.186.216', 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_7_8) AppleWebKit/5360 (KHTML, like Gecko) Chrome/37.0.896.0 Mobile Safari/5360', '2025-05-31 12:54:31', '2025-06-25 17:23:21'),
	(3, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 6, 'http://zelio.test', 'Hazle Stehr', 'rath.dangelo@hotmail.com', 'https://friendsofbotble.com', 'Wow, I never knew about this before!', 'approved', '150.9.229.82', 'Mozilla/5.0 (compatible; MSIE 11.0; Windows 98; Win 9x 4.90; Trident/3.1)', '2025-06-20 22:14:06', '2025-06-25 17:23:21'),
	(4, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 8, 'http://zelio.test', 'Raymundo Bauch III', 'hosea.gusikowski@hotmail.com', 'https://friendsofbotble.com', 'Great job on explaining such a complex topic.', 'approved', '143.28.33.10', 'Mozilla/5.0 (Windows NT 5.0) AppleWebKit/5352 (KHTML, like Gecko) Chrome/37.0.864.0 Mobile Safari/5352', '2025-05-29 17:07:17', '2025-06-25 17:23:21'),
	(5, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 5, 'http://zelio.test', 'Mrs. Reva Schamberger II', 'brionna55@ward.net', 'https://friendsofbotble.com', 'I have a question about the third paragraph.', 'approved', '149.173.232.66', 'Mozilla/5.0 (Windows NT 6.1; nl-NL; rv:1.9.1.20) Gecko/20181025 Firefox/36.0', '2025-06-13 17:51:33', '2025-06-25 17:23:21'),
	(6, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 7, 'http://zelio.test', 'Dr. Mohammed Glover IV', 'spinka.harmony@hotmail.com', 'https://friendsofbotble.com', 'This article changed my perspective entirely.', 'approved', '123.71.230.94', 'Mozilla/5.0 (X11; Linux x86_64; rv:6.0) Gecko/20180920 Firefox/37.0', '2025-06-09 11:15:45', '2025-06-25 17:23:21'),
	(7, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 15, 'http://zelio.test', 'Jace Hoeger', 'jaylin67@hotmail.com', 'https://friendsofbotble.com', 'I appreciate the effort you put into this.', 'approved', '39.134.7.53', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5312 (KHTML, like Gecko) Chrome/40.0.878.0 Mobile Safari/5312', '2025-06-11 03:01:28', '2025-06-25 17:23:21'),
	(8, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 1, 'http://zelio.test', 'Dr. Maxie Daniel', 'rdonnelly@beahan.com', 'https://friendsofbotble.com', 'This is exactly what I was looking for, thank you!', 'approved', '43.187.209.31', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_7_5 rv:5.0) Gecko/20161028 Firefox/36.0', '2025-06-19 08:15:49', '2025-06-25 17:23:21'),
	(9, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 10, 'http://zelio.test', 'Kevon Flatley', 'rmedhurst@gmail.com', 'https://friendsofbotble.com', 'I disagree with some points mentioned here, though.', 'approved', '141.29.198.40', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2) AppleWebKit/536.1 (KHTML, like Gecko) Chrome/89.0.4683.15 Safari/536.1 Edg/89.01028.70', '2025-06-19 15:35:58', '2025-06-25 17:23:21'),
	(10, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 13, 'http://zelio.test', 'Rose Prosacco', 'zane.auer@jacobson.com', 'https://friendsofbotble.com', 'Could you provide more examples to illustrate your point?', 'approved', '125.79.74.130', 'Mozilla/5.0 (compatible; MSIE 8.0; Windows 95; Trident/4.0)', '2025-05-28 15:42:43', '2025-06-25 17:23:21'),
	(11, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 14, 'http://zelio.test', 'Miss Savanna Hyatt Sr.', 'alejandrin.rodriguez@marks.org', 'https://friendsofbotble.com', 'I wish there were more articles like this out there.', 'approved', '71.249.203.7', 'Opera/9.27 (X11; Linux i686; en-US) Presto/2.11.175 Version/10.00', '2025-05-27 20:55:18', '2025-06-25 17:23:21'),
	(12, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 14, 'http://zelio.test', 'Yadira Ratke', 'meta54@yahoo.com', 'https://friendsofbotble.com', 'I\'m bookmarking this for future reference.', 'approved', '76.22.240.153', 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10_5_0) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/90.0.4492.18 Safari/535.1 Edg/90.01024.70', '2025-06-15 10:04:36', '2025-06-25 17:23:21'),
	(13, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 15, 'http://zelio.test', 'Dr. Hunter Hartmann', 'jakayla85@goldner.com', 'https://friendsofbotble.com', 'I\'ve shared this with my friends, they loved it!', 'approved', '92.144.144.94', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/534.0 (KHTML, like Gecko) Version/15.0 EdgiOS/89.01112.9 Mobile/15E148 Safari/534.0', '2025-06-17 17:26:52', '2025-06-25 17:23:21'),
	(14, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 14, 'http://zelio.test', 'Rachel White', 'ilene.dach@nolan.com', 'https://friendsofbotble.com', 'This article is a must-read for everyone interested in the topic.', 'approved', '22.148.31.149', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_7) AppleWebKit/5360 (KHTML, like Gecko) Chrome/39.0.895.0 Mobile Safari/5360', '2025-06-05 11:41:22', '2025-06-25 17:23:21'),
	(15, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 6, 'http://zelio.test', 'Fredy Turner PhD', 'tressie.davis@mcdermott.com', 'https://friendsofbotble.com', 'Thank you for shedding light on this important issue.', 'approved', '204.199.136.132', 'Mozilla/5.0 (X11; Linux i686; rv:6.0) Gecko/20111213 Firefox/35.0', '2025-05-27 21:50:38', '2025-06-25 17:23:21'),
	(16, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 4, 'http://zelio.test', 'Ms. Viva Feil', 'gerhold.tristin@white.com', 'https://friendsofbotble.com', 'I\'ve been searching for information on this topic, glad I found this article.', 'approved', '87.222.153.6', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/4.0)', '2025-06-17 17:43:03', '2025-06-25 17:23:21'),
	(17, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 12, 'http://zelio.test', 'Buddy Lakin', 'eromaguera@von.com', 'https://friendsofbotble.com', 'I\'m blown away by the insights shared in this article.', 'approved', '74.183.145.141', 'Mozilla/5.0 (Windows; U; Windows NT 6.2) AppleWebKit/531.48.4 (KHTML, like Gecko) Version/4.0.2 Safari/531.48.4', '2025-06-12 13:46:40', '2025-06-25 17:23:21'),
	(18, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 3, 'http://zelio.test', 'Ms. Donna Reilly', 'alex.ohara@gmail.com', 'https://friendsofbotble.com', 'This article tackles a complex topic with clarity.', 'approved', '190.218.163.251', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/537.1 (KHTML, like Gecko) Version/15.0 EdgiOS/81.01047.55 Mobile/15E148 Safari/537.1', '2025-06-21 23:58:02', '2025-06-25 17:23:21'),
	(19, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 13, 'http://zelio.test', 'Mr. Ryder Abshire IV', 'daija39@yahoo.com', 'https://friendsofbotble.com', 'I\'m going to reflect on the ideas presented in this article.', 'approved', '175.141.192.34', 'Mozilla/5.0 (compatible; MSIE 11.0; Windows CE; Trident/5.1)', '2025-06-22 18:34:09', '2025-06-25 17:23:21'),
	(20, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 8, 'http://zelio.test', 'Emerson Littel', 'anibal.botsford@weimann.com', 'https://friendsofbotble.com', 'The author\'s passion for the subject shines through in this article.', 'approved', '1.232.20.34', 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_0 rv:2.0) Gecko/20120510 Firefox/36.0', '2025-06-25 16:12:57', '2025-06-25 17:23:21'),
	(21, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 8, 'http://zelio.test', 'Skylar Denesik', 'fboyer@armstrong.com', 'https://friendsofbotble.com', 'This article challenged my preconceptions in a thought-provoking way.', 'approved', '186.164.128.44', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows 98; Trident/3.1)', '2025-05-29 21:21:30', '2025-06-25 17:23:21'),
	(22, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 8, 'http://zelio.test', 'Gudrun Wolf', 'brianne86@will.com', 'https://friendsofbotble.com', 'I\'ve added this article to my reading list, it\'s worth revisiting.', 'approved', '152.45.136.210', 'Mozilla/5.0 (compatible; MSIE 7.0; Windows 98; Win 9x 4.90; Trident/4.0)', '2025-06-25 08:20:50', '2025-06-25 17:23:21'),
	(23, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 11, 'http://zelio.test', 'Abe Mante', 'hansen.roslyn@yahoo.com', 'https://friendsofbotble.com', 'This article offers practical advice that I can apply in real life.', 'approved', '164.213.163.245', 'Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.2; Trident/3.0)', '2025-06-15 16:05:01', '2025-06-25 17:23:21'),
	(24, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 1, 'http://zelio.test', 'Marjory Eichmann II', 'carlotta.quitzon@konopelski.com', 'https://friendsofbotble.com', 'I\'m going to recommend this article to my study group.', 'approved', '112.167.21.181', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5 rv:2.0; sl-SI) AppleWebKit/533.46.7 (KHTML, like Gecko) Version/4.0.2 Safari/533.46.7', '2025-06-11 18:28:25', '2025-06-25 17:23:21'),
	(25, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 3, 'http://zelio.test', 'Louvenia Satterfield', 'mueller.carolyn@gmail.com', 'https://friendsofbotble.com', 'The examples provided really helped me understand the concept better.', 'approved', '51.30.179.123', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/536.2 (KHTML, like Gecko) Version/15.0 EdgiOS/80.01095.54 Mobile/15E148 Safari/536.2', '2025-06-21 09:20:03', '2025-06-25 17:23:21'),
	(26, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 6, 'http://zelio.test', 'Cynthia Wintheiser Jr.', 'jacinthe65@gmail.com', 'https://friendsofbotble.com', 'I resonate with the ideas presented here.', 'approved', '39.141.240.195', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.2 (KHTML, like Gecko) Chrome/86.0.4626.85 Safari/534.2 Edg/86.01049.54', '2025-06-19 02:46:29', '2025-06-25 17:23:21'),
	(27, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 13, 'http://zelio.test', 'Myrl Crooks', 'dooley.raven@yahoo.com', 'https://friendsofbotble.com', 'This article made me think critically about the topic.', 'approved', '137.173.26.135', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_6) AppleWebKit/5321 (KHTML, like Gecko) Chrome/39.0.833.0 Mobile Safari/5321', '2025-06-22 16:29:25', '2025-06-25 17:23:21'),
	(28, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 2, 'http://zelio.test', 'Monte Bartoletti', 'xbogisich@dicki.org', 'https://friendsofbotble.com', 'I\'ll definitely come back to this article for reference.', 'approved', '252.251.124.95', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 4.0; Trident/5.1)', '2025-06-18 15:11:54', '2025-06-25 17:23:21'),
	(29, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 14, 'http://zelio.test', 'Mrs. Neha Schmidt', 'jaiden.armstrong@kuphal.com', 'https://friendsofbotble.com', 'I\'ve shared this on social media, it\'s too good not to share.', 'approved', '97.103.124.198', 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10_6_6) AppleWebKit/5361 (KHTML, like Gecko) Chrome/38.0.888.0 Mobile Safari/5361', '2025-06-25 14:13:38', '2025-06-25 17:23:21'),
	(30, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 2, 'http://zelio.test', 'Asia Lockman', 'jstoltenberg@hotmail.com', 'https://friendsofbotble.com', 'This article presents a balanced view on a controversial topic.', 'approved', '114.64.228.251', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/82.0.4633.69 Safari/535.1 EdgA/82.01045.54', '2025-06-10 05:56:17', '2025-06-25 17:23:21'),
	(31, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 15, 'http://zelio.test', 'Miss Lia Powlowski', 'elenor.doyle@vonrueden.com', 'https://friendsofbotble.com', 'I\'m glad I stumbled upon this article, it\'s a gem.', 'approved', '24.76.183.61', 'Opera/8.24 (X11; Linux x86_64; en-US) Presto/2.10.330 Version/10.00', '2025-06-10 12:43:23', '2025-06-25 17:23:21'),
	(32, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 13, 'http://zelio.test', 'Heber Conroy', 'koelpin.camron@gmail.com', 'https://friendsofbotble.com', 'I\'ve been struggling with this, your article helped a lot.', 'approved', '35.199.208.122', 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_6_8) AppleWebKit/5310 (KHTML, like Gecko) Chrome/37.0.865.0 Mobile Safari/5310', '2025-06-16 23:40:31', '2025-06-25 17:23:21'),
	(33, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 1, 'http://zelio.test', 'Moriah Ferry', 'dock42@nienow.com', 'https://friendsofbotble.com', 'I\'ve learned something new today, thanks to this article.', 'approved', '227.184.227.127', 'Mozilla/5.0 (Windows; U; Windows NT 6.0) AppleWebKit/531.13.1 (KHTML, like Gecko) Version/5.0.3 Safari/531.13.1', '2025-05-31 05:58:34', '2025-06-25 17:23:21'),
	(34, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 7, 'http://zelio.test', 'Rhoda Effertz', 'esteban.stroman@yahoo.com', 'https://friendsofbotble.com', 'Kudos to the author for a well-researched piece.', 'approved', '179.80.194.223', 'Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20150310 Firefox/36.0', '2025-05-30 14:02:53', '2025-06-25 17:23:21'),
	(35, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 6, 'http://zelio.test', 'Ms. Rosemary Bashirian Jr.', 'etoy@gmail.com', 'https://friendsofbotble.com', 'I\'m impressed by the depth of knowledge demonstrated here.', 'approved', '34.57.168.217', 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_2) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/93.0.4004.44 Safari/532.1 Edg/93.01096.69', '2025-06-13 17:51:19', '2025-06-25 17:23:21'),
	(36, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 1, 'http://zelio.test', 'Crystel Lindgren Sr.', 'bartoletti.molly@hotmail.com', 'https://friendsofbotble.com', 'This article challenged my assumptions in a good way.', 'approved', '148.128.7.158', 'Opera/8.71 (Windows NT 6.2; en-US) Presto/2.11.236 Version/11.00', '2025-06-08 04:20:06', '2025-06-25 17:23:21'),
	(37, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 2, 'http://zelio.test', 'Prof. Geo Vandervort PhD', 'marquardt.herminio@yahoo.com', 'https://friendsofbotble.com', 'I\'ve shared this with my colleagues, it\'s worth discussing.', 'approved', '214.51.149.217', 'Opera/9.12 (Windows NT 5.0; sl-SI) Presto/2.10.315 Version/12.00', '2025-06-05 02:05:38', '2025-06-25 17:23:21'),
	(38, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 9, 'http://zelio.test', 'Hans Green', 'eliane06@hintz.com', 'https://friendsofbotble.com', 'The information presented here is very valuable.', 'approved', '88.161.226.148', 'Mozilla/5.0 (Windows NT 5.0) AppleWebKit/5342 (KHTML, like Gecko) Chrome/39.0.834.0 Mobile Safari/5342', '2025-06-06 11:35:57', '2025-06-25 17:23:21'),
	(39, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 2, 'http://zelio.test', 'Corine Langworth', 'gquigley@yahoo.com', 'https://friendsofbotble.com', 'You have a talent for explaining complex topics clearly.', 'approved', '65.120.8.51', 'Mozilla/5.0 (Windows NT 5.01; nl-NL; rv:1.9.1.20) Gecko/20160407 Firefox/36.0', '2025-06-25 04:11:26', '2025-06-25 17:23:21'),
	(40, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 15, 'http://zelio.test', 'Kaylee Kuvalis', 'lisette.kreiger@hotmail.com', 'https://friendsofbotble.com', 'I\'m inspired to learn more about this after reading your article.', 'approved', '18.55.215.28', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/94.0.4240.86 Safari/535.2 EdgA/94.01129.32', '2025-06-24 14:04:55', '2025-06-25 17:23:21'),
	(41, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 15, 'http://zelio.test', 'Angelica Adams PhD', 'bethany.kozey@smitham.info', 'https://friendsofbotble.com', 'This article deserves wider recognition.', 'approved', '86.51.186.4', 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8 rv:5.0; sl-SI) AppleWebKit/534.12.1 (KHTML, like Gecko) Version/5.0.3 Safari/534.12.1', '2025-06-16 05:27:42', '2025-06-25 17:23:21'),
	(42, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 14, 'http://zelio.test', 'Tiana Gaylord', 'pmitchell@hotmail.com', 'https://friendsofbotble.com', 'I\'m grateful for the insights shared in this piece.', 'approved', '25.65.162.222', 'Mozilla/5.0 (iPad; CPU OS 7_0_1 like Mac OS X; en-US) AppleWebKit/533.28.6 (KHTML, like Gecko) Version/3.0.5 Mobile/8B119 Safari/6533.28.6', '2025-06-12 11:59:35', '2025-06-25 17:23:21'),
	(43, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 3, 'http://zelio.test', 'Prof. Mathew Hickle V', 'rowena.gislason@luettgen.com', 'https://friendsofbotble.com', 'The author presents a balanced view on a controversial topic.', 'approved', '255.168.74.58', 'Opera/9.25 (Windows NT 6.0; en-US) Presto/2.8.175 Version/12.00', '2025-05-30 23:31:00', '2025-06-25 17:23:21'),
	(44, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 14, 'http://zelio.test', 'Jennie Erdman V', 'mabel78@yahoo.com', 'https://friendsofbotble.com', 'I\'m glad I stumbled upon this article, it\'s', 'approved', '52.14.151.100', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/533.1 (KHTML, like Gecko) Version/15.0 EdgiOS/79.01080.61 Mobile/15E148 Safari/533.1', '2025-06-20 07:50:24', '2025-06-25 17:23:21'),
	(45, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 1, 'http://zelio.test', 'Meda Turner', 'mackenzie.crooks@yahoo.com', 'https://friendsofbotble.com', 'I\'ve been searching for information on this topic, glad I found this article. It\'s incredibly insightful and provides a comprehensive overview of the subject matter. I appreciate the effort put into researching and writing this piece. It\'s truly eye-opening and has given me a new perspective. Thank you for sharing your knowledge with us!', 'approved', '112.122.91.64', 'Mozilla/5.0 (Windows NT 5.1; nl-NL; rv:1.9.2.20) Gecko/20150108 Firefox/36.0', '2025-06-01 19:19:26', '2025-06-25 17:23:21'),
	(46, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 9, 'http://zelio.test', 'Marcus Deckow', 'kkirlin@ferry.info', 'https://friendsofbotble.com', 'This article is a masterpiece! It dives deep into the topic and offers valuable insights that are both thought-provoking and enlightening. The author\'s expertise is evident throughout, making it a compelling read from start to finish. I\'ll definitely be coming back to this for reference in the future.', 'approved', '43.53.22.167', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 5.01; Trident/4.0)', '2025-05-31 16:41:48', '2025-06-25 17:23:21'),
	(47, NULL, NULL, NULL, 'Botble\\Blog\\Models\\Post', 6, 'http://zelio.test', 'Carleton Kessler', 'ozella45@hotmail.com', 'https://friendsofbotble.com', 'I\'m amazed by the depth of analysis in this article. It covers a wide range of aspects related to the topic, providing a comprehensive understanding. The clarity of explanation is commendable, making complex concepts easy to grasp. This article has enriched my understanding and sparked further curiosity. Kudos to the author!', 'approved', '43.39.133.135', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_8_4 rv:4.0; en-US) AppleWebKit/534.16.3 (KHTML, like Gecko) Version/5.0.5 Safari/534.16.3', '2025-06-12 12:52:05', '2025-06-25 17:23:21');

-- Dumping structure for table devfolio.galleries
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.galleries: ~8 rows (approximately)
INSERT INTO `galleries` (`id`, `name`, `description`, `is_featured`, `order`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Perfect', 'Corrupti nihil omnis labore dolor. Minima ipsam qui et magnam sunt hic. Et consequatur quia dicta alias fugit quisquam amet.', 0, 0, 'main/galleries/1.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(2, 'New Day', 'Eos reprehenderit quis nostrum ipsam. Qui ad sunt quisquam maxime quasi odio. Natus ipsam in inventore cumque accusamus.', 0, 0, 'main/galleries/2.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(3, 'Happy Day', 'Vel odit rerum numquam. Aliquam ut quam harum ad eaque sunt ab. Praesentium assumenda dolores dolores nemo et modi. Maxime sapiente ex officia.', 0, 0, 'main/galleries/3.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(4, 'Nature', 'Iusto ipsa sed laboriosam numquam ducimus. Sit sapiente velit facere excepturi. Harum voluptatem facilis et consequatur nostrum assumenda labore.', 0, 0, 'main/galleries/4.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(5, 'Morning', 'Qui numquam est odio commodi inventore. Tempora aut ducimus ex ut voluptas non. Non et quia et velit at non molestias.', 0, 0, 'main/galleries/5.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(6, 'Sunset', 'Itaque aut molestiae dolores et ratione incidunt. Quae sint id voluptatem molestiae incidunt odit.', 0, 0, 'main/galleries/6.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(7, 'Ocean Views', 'Et est labore sapiente error tempora iure et. Rem numquam nulla quas nihil et consequatur magnam. Culpa libero est dolor maiores.', 0, 0, 'main/galleries/7.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(8, 'Adventure Time', 'Facilis voluptas provident et enim. Quis alias cupiditate qui animi dolore. Maiores similique soluta possimus asperiores.', 0, 0, 'main/galleries/8.jpg', 1, 'published', '2025-06-25 17:23:22', '2025-06-25 17:23:22');

-- Dumping structure for table devfolio.galleries_translations
CREATE TABLE IF NOT EXISTS `galleries_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.galleries_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.gallery_meta
CREATE TABLE IF NOT EXISTS `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.gallery_meta: ~8 rows (approximately)
INSERT INTO `gallery_meta` (`id`, `images`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
	(1, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 1, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(2, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 2, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(3, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 3, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(4, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 4, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(5, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 5, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(6, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 6, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(7, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 7, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(8, '[{"img":"main\\/galleries\\/1.jpg","description":""},{"img":"main\\/galleries\\/2.jpg","description":""},{"img":"main\\/galleries\\/3.jpg","description":""},{"img":"main\\/galleries\\/4.jpg","description":""},{"img":"main\\/galleries\\/5.jpg","description":""},{"img":"main\\/galleries\\/6.jpg","description":""},{"img":"main\\/galleries\\/7.jpg","description":""},{"img":"main\\/galleries\\/8.jpg","description":""}]', 8, 'Botble\\Gallery\\Models\\Gallery', '2025-06-25 17:23:22', '2025-06-25 17:23:22');

-- Dumping structure for table devfolio.gallery_meta_translations
CREATE TABLE IF NOT EXISTS `gallery_meta_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.gallery_meta_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.jobs: ~0 rows (approximately)

-- Dumping structure for table devfolio.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.languages: ~0 rows (approximately)
INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
	(1, 'English', 'en', 'en_US', 'us', 1, 0, 0);

-- Dumping structure for table devfolio.language_meta
CREATE TABLE IF NOT EXISTS `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.language_meta: ~2 rows (approximately)
INSERT INTO `language_meta` (`lang_meta_id`, `lang_meta_code`, `lang_meta_origin`, `reference_id`, `reference_type`) VALUES
	(1, 'en_US', 'c4bce0a7805ed3127635e97ec1ab7d2c', 1, 'Botble\\Menu\\Models\\MenuLocation'),
	(2, 'en_US', '61943cf6ab812a1b7a3caaa73b8ffd98', 1, 'Botble\\Menu\\Models\\Menu');

-- Dumping structure for table devfolio.media_files
CREATE TABLE IF NOT EXISTS `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.media_files: ~61 rows (approximately)
INSERT INTO `media_files` (`id`, `user_id`, `name`, `alt`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`, `visibility`) VALUES
	(1, 0, '1', '1', 2, 'image/png', 9448, 'main/posts/1.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(2, 0, '10', '10', 2, 'image/png', 9448, 'main/posts/10.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(3, 0, '11', '11', 2, 'image/png', 9448, 'main/posts/11.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(4, 0, '12', '12', 2, 'image/png', 9448, 'main/posts/12.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(5, 0, '2', '2', 2, 'image/png', 9448, 'main/posts/2.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(6, 0, '3', '3', 2, 'image/png', 9448, 'main/posts/3.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(7, 0, '4', '4', 2, 'image/png', 9448, 'main/posts/4.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(8, 0, '5', '5', 2, 'image/png', 9448, 'main/posts/5.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(9, 0, '6', '6', 2, 'image/png', 9448, 'main/posts/6.png', '[]', '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL, 'public'),
	(10, 0, '7', '7', 2, 'image/png', 9448, 'main/posts/7.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(11, 0, '8', '8', 2, 'image/png', 9448, 'main/posts/8.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(12, 0, '9', '9', 2, 'image/png', 9448, 'main/posts/9.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(13, 0, 'background', 'background', 2, 'image/png', 9448, 'main/posts/background.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(14, 0, '1', '1', 3, 'image/png', 2100, 'main/avatars/1.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(15, 0, '2', '2', 3, 'image/png', 2100, 'main/avatars/2.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(16, 0, 'man', 'man', 3, 'image/png', 2100, 'main/avatars/man.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(17, 0, '1', '1', 4, 'image/png', 9448, 'main/projects/1.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(18, 0, '2', '2', 4, 'image/png', 9448, 'main/projects/2.png', '[]', '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL, 'public'),
	(19, 0, '3', '3', 4, 'image/png', 9448, 'main/projects/3.png', '[]', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, 'public'),
	(20, 0, '4', '4', 4, 'image/png', 9448, 'main/projects/4.png', '[]', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, 'public'),
	(21, 0, 'corporation-avatar', 'corporation-avatar', 6, 'image/png', 674, 'code/general/corporation-avatar.png', '[]', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, 'public'),
	(22, 0, 'favicon', 'favicon', 6, 'image/png', 2465, 'code/general/favicon.png', '[]', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, 'public'),
	(23, 0, 'footer-bg', 'footer-bg', 6, 'image/png', 6888, 'code/general/footer-bg.png', '[]', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, 'public'),
	(24, 0, 'hero-bg-dark', 'hero-bg-dark', 6, 'image/png', 113996, 'code/general/hero-bg-dark.png', '[]', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, 'public'),
	(25, 0, 'hero-bg', 'hero-bg', 6, 'image/png', 116152, 'code/general/hero-bg.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(26, 0, 'logo-dark', 'logo-dark', 6, 'image/png', 2465, 'code/general/logo-dark.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(27, 0, 'people-shape', 'people-shape', 6, 'image/png', 7048, 'code/general/people-shape.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(28, 0, 'people', 'people', 6, 'image/png', 10553, 'code/general/people.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(29, 0, 'projects-bg', 'projects-bg', 6, 'image/png', 80873, 'code/general/projects-bg.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(30, 0, 'services-bg', 'services-bg', 6, 'image/png', 18424, 'code/general/services-bg.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(31, 0, 'static-bg', 'static-bg', 6, 'image/png', 26400, 'code/general/static-bg.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(32, 0, '1', '1', 7, 'image/png', 1866, 'code/skills/1.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(33, 0, '2', '2', 7, 'image/png', 1866, 'code/skills/2.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(34, 0, '3', '3', 7, 'image/png', 1866, 'code/skills/3.png', '[]', '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL, 'public'),
	(35, 0, '4', '4', 7, 'image/png', 1866, 'code/skills/4.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(36, 0, '5', '5', 7, 'image/png', 1866, 'code/skills/5.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(37, 0, '6', '6', 7, 'image/png', 1866, 'code/skills/6.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(38, 0, '7', '7', 7, 'image/png', 1866, 'code/skills/7.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(39, 0, '8', '8', 7, 'image/png', 1866, 'code/skills/8.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(40, 0, '9', '9', 7, 'image/png', 1866, 'code/skills/9.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(41, 0, 'bravado', 'bravado', 8, 'image/png', 1726, 'code/companies/bravado.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(42, 0, 'gocardless', 'gocardless', 8, 'image/png', 1726, 'code/companies/gocardless.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(43, 0, 'google', 'google', 8, 'image/png', 1726, 'code/companies/google.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(44, 0, 'intercom', 'intercom', 8, 'image/png', 1726, 'code/companies/intercom.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(45, 0, 'monzo', 'monzo', 8, 'image/png', 1726, 'code/companies/monzo.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(46, 0, 'samsung', 'samsung', 8, 'image/png', 1726, 'code/companies/samsung.png', '[]', '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL, 'public'),
	(47, 0, 'spotify', 'spotify', 8, 'image/png', 1726, 'code/companies/spotify.png', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(48, 0, 'stripe', 'stripe', 8, 'image/png', 1726, 'code/companies/stripe.png', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(49, 0, 'visa', 'visa', 8, 'image/png', 1726, 'code/companies/visa.png', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(50, 0, 'amazon', 'amazon', 9, 'image/png', 2100, 'code/experiences/amazon.png', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(51, 0, 'google', 'google', 9, 'image/png', 2100, 'code/experiences/google.png', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(52, 0, 'paypal', 'paypal', 9, 'image/png', 2100, 'code/experiences/paypal.png', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(53, 0, 'x', 'x', 9, 'image/png', 2100, 'code/experiences/x.png', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(54, 0, '1', '1', 10, 'image/jpeg', 61527, 'main/galleries/1.jpg', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(55, 0, '2', '2', 10, 'image/jpeg', 70517, 'main/galleries/2.jpg', '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL, 'public'),
	(56, 0, '3', '3', 10, 'image/jpeg', 120412, 'main/galleries/3.jpg', '[]', '2025-06-25 17:23:22', '2025-06-25 17:23:22', NULL, 'public'),
	(57, 0, '4', '4', 10, 'image/jpeg', 230496, 'main/galleries/4.jpg', '[]', '2025-06-25 17:23:22', '2025-06-25 17:23:22', NULL, 'public'),
	(58, 0, '5', '5', 10, 'image/jpeg', 194413, 'main/galleries/5.jpg', '[]', '2025-06-25 17:23:22', '2025-06-25 17:23:22', NULL, 'public'),
	(59, 0, '6', '6', 10, 'image/jpeg', 82763, 'main/galleries/6.jpg', '[]', '2025-06-25 17:23:22', '2025-06-25 17:23:22', NULL, 'public'),
	(60, 0, '7', '7', 10, 'image/jpeg', 62110, 'main/galleries/7.jpg', '[]', '2025-06-25 17:23:22', '2025-06-25 17:23:22', NULL, 'public'),
	(61, 0, '8', '8', 10, 'image/jpeg', 156619, 'main/galleries/8.jpg', '[]', '2025-06-25 17:23:22', '2025-06-25 17:23:22', NULL, 'public');

-- Dumping structure for table devfolio.media_folders
CREATE TABLE IF NOT EXISTS `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.media_folders: ~10 rows (approximately)
INSERT INTO `media_folders` (`id`, `user_id`, `name`, `color`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 0, 'main', NULL, 'main', 0, '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL),
	(2, 0, 'posts', NULL, 'posts', 1, '2025-06-25 17:23:16', '2025-06-25 17:23:16', NULL),
	(3, 0, 'avatars', NULL, 'avatars', 1, '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL),
	(4, 0, 'projects', NULL, 'projects', 1, '2025-06-25 17:23:17', '2025-06-25 17:23:17', NULL),
	(5, 0, 'code', NULL, 'code', 0, '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL),
	(6, 0, 'general', NULL, 'general', 5, '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL),
	(7, 0, 'skills', NULL, 'skills', 5, '2025-06-25 17:23:19', '2025-06-25 17:23:19', NULL),
	(8, 0, 'companies', NULL, 'companies', 5, '2025-06-25 17:23:20', '2025-06-25 17:23:20', NULL),
	(9, 0, 'experiences', NULL, 'experiences', 5, '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL),
	(10, 0, 'galleries', NULL, 'galleries', 1, '2025-06-25 17:23:21', '2025-06-25 17:23:21', NULL);

-- Dumping structure for table devfolio.media_settings
CREATE TABLE IF NOT EXISTS `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.media_settings: ~0 rows (approximately)

-- Dumping structure for table devfolio.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.menus: ~0 rows (approximately)
INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Main Menu', 'main-menu', 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21');

-- Dumping structure for table devfolio.menu_locations
CREATE TABLE IF NOT EXISTS `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.menu_locations: ~0 rows (approximately)
INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
	(1, 1, 'main-menu', '2025-06-25 17:23:21', '2025-06-25 17:23:21');

-- Dumping structure for table devfolio.menu_nodes
CREATE TABLE IF NOT EXISTS `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.menu_nodes: ~9 rows (approximately)
INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
	(1, 1, 0, 1, 'Botble\\Page\\Models\\Page', '/home', NULL, 0, 'Home', NULL, '_self', 1, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(2, 1, 1, NULL, NULL, 'https://zelio.botble.com', NULL, 0, 'Home 1 - Designer', NULL, '_blank', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(3, 1, 1, NULL, NULL, 'https://zelio-developer.botble.com', NULL, 1, 'Home 2 - Developer', NULL, '_blank', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(4, 1, 1, NULL, NULL, 'https://zelio-writer.botble.com', NULL, 2, 'Home 3 - Writer', NULL, '_blank', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(5, 1, 0, 2, 'Botble\\Page\\Models\\Page', '/services', NULL, 1, 'Services', NULL, '_self', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(6, 1, 0, 3, 'Botble\\Page\\Models\\Page', '/projects', NULL, 2, 'Portfolio', NULL, '_self', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(7, 1, 0, 4, 'Botble\\Page\\Models\\Page', '/pricing', NULL, 3, 'Pricing', NULL, '_self', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(8, 1, 0, 5, 'Botble\\Page\\Models\\Page', '/blog', NULL, 4, 'Blog', NULL, '_self', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(9, 1, 0, 6, 'Botble\\Page\\Models\\Page', '/contact', NULL, 5, 'Contact', NULL, '_self', 0, '2025-06-25 17:23:21', '2025-06-25 17:23:21');

-- Dumping structure for table devfolio.meta_boxes
CREATE TABLE IF NOT EXISTS `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.meta_boxes: ~18 rows (approximately)
INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
	(1, 'icon', '["ti ti-api"]', 1, 'Botble\\Portfolio\\Models\\Service', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(2, 'icon', '["ti ti-code"]', 2, 'Botble\\Portfolio\\Models\\Service', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(3, 'icon', '["ti ti-device-mobile"]', 3, 'Botble\\Portfolio\\Models\\Service', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(4, 'icon', '["ti ti-server"]', 4, 'Botble\\Portfolio\\Models\\Service', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(5, 'icon', '["ti ti-cloud"]', 5, 'Botble\\Portfolio\\Models\\Service', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(6, 'icon', '["ti ti-database"]', 6, 'Botble\\Portfolio\\Models\\Service', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(7, 'link', '["https:\\/\\/example.com\\/crm-system"]', 1, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(8, 'github_url', '["https:\\/\\/github.com\\/botble"]', 1, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(9, 'category_ids', '[[1]]', 1, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(10, 'link', '["https:\\/\\/example.com\\/e-learning"]', 2, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(11, 'github_url', '["https:\\/\\/github.com\\/botble"]', 2, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(12, 'category_ids', '[[1,2]]', 2, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(13, 'link', '["https:\\/\\/example.com\\/mobile-banking"]', 3, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(14, 'github_url', '["https:\\/\\/github.com\\/botble"]', 3, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(15, 'category_ids', '[[3]]', 3, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(16, 'link', '["https:\\/\\/example.com\\/cloud-infrastructure"]', 4, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(17, 'github_url', '["https:\\/\\/github.com\\/botble"]', 4, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(18, 'category_ids', '[[4]]', 4, 'Botble\\Portfolio\\Models\\Project', '2025-06-25 17:23:18', '2025-06-25 17:23:18');

-- Dumping structure for table devfolio.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.migrations: ~89 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000001_create_cache_table', 1),
	(2, '2013_04_09_032329_create_base_tables', 1),
	(3, '2013_04_09_062329_create_revisions_table', 1),
	(4, '2014_10_12_000000_create_users_table', 1),
	(5, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(6, '2015_06_18_033822_create_blog_table', 1),
	(7, '2015_06_29_025744_create_audit_history', 1),
	(8, '2016_05_28_112028_create_system_request_logs_table', 1),
	(9, '2016_06_10_230148_create_acl_tables', 1),
	(10, '2016_06_14_230857_create_menus_table', 1),
	(11, '2016_06_17_091537_create_contacts_table', 1),
	(12, '2016_06_28_221418_create_pages_table', 1),
	(13, '2016_10_03_032336_create_languages_table', 1),
	(14, '2016_10_05_074239_create_setting_table', 1),
	(15, '2016_10_07_193005_create_translations_table', 1),
	(16, '2016_10_13_150201_create_galleries_table', 1),
	(17, '2016_11_28_032840_create_dashboard_widget_tables', 1),
	(18, '2016_12_16_084601_create_widgets_table', 1),
	(19, '2017_05_09_070343_create_media_tables', 1),
	(20, '2017_10_24_154832_create_newsletter_table', 1),
	(21, '2017_11_03_070450_create_slug_table', 1),
	(22, '2018_07_09_214610_create_testimonial_table', 1),
	(23, '2018_07_09_221238_create_faq_table', 1),
	(24, '2019_01_05_053554_create_jobs_table', 1),
	(25, '2019_08_19_000000_create_failed_jobs_table', 1),
	(26, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(27, '2021_02_16_092633_remove_default_value_for_author_type', 1),
	(28, '2021_10_25_021023_fix-priority-load-for-language-advanced', 1),
	(29, '2021_12_03_030600_create_blog_translations', 1),
	(30, '2021_12_03_075608_create_page_translations', 1),
	(31, '2021_12_03_082134_create_faq_translations', 1),
	(32, '2021_12_03_082953_create_gallery_translations', 1),
	(33, '2021_12_03_083642_create_testimonials_translations', 1),
	(34, '2022_04_19_113923_add_index_to_table_posts', 1),
	(35, '2022_04_20_100851_add_index_to_media_table', 1),
	(36, '2022_04_20_101046_add_index_to_menu_table', 1),
	(37, '2022_04_30_034048_create_gallery_meta_translations_table', 1),
	(38, '2022_07_10_034813_move_lang_folder_to_root', 1),
	(39, '2022_08_04_051940_add_missing_column_expires_at', 1),
	(40, '2022_09_01_000001_create_admin_notifications_tables', 1),
	(41, '2022_10_14_024629_drop_column_is_featured', 1),
	(42, '2022_11_18_063357_add_missing_timestamp_in_table_settings', 1),
	(43, '2022_12_02_093615_update_slug_index_columns', 1),
	(44, '2023_01_30_024431_add_alt_to_media_table', 1),
	(45, '2023_02_16_042611_drop_table_password_resets', 1),
	(46, '2023_04_23_005903_add_column_permissions_to_admin_notifications', 1),
	(47, '2023_05_10_075124_drop_column_id_in_role_users_table', 1),
	(48, '2023_07_06_011444_create_slug_translations_table', 1),
	(49, '2023_07_25_072632_create_portfolio_tables', 1),
	(50, '2023_08_11_060908_create_announcements_table', 1),
	(51, '2023_08_21_090810_make_page_content_nullable', 1),
	(52, '2023_08_29_074620_make_column_author_id_nullable', 1),
	(53, '2023_08_29_075308_make_column_user_id_nullable', 1),
	(54, '2023_09_11_023233_create_pf_custom_fields_table', 1),
	(55, '2023_09_13_042633_add_columns_to_pf_projects_table', 1),
	(56, '2023_09_13_044041_create_pf_project_categories_table', 1),
	(57, '2023_09_14_021936_update_index_for_slugs_table', 1),
	(58, '2023_09_14_022423_add_index_for_language_table', 1),
	(59, '2023_09_22_061723_create_custom_fields_translations_table', 1),
	(60, '2023_09_22_343531_remove_project_categories_table', 1),
	(61, '2023_11_05_081701_fix_projects_table', 1),
	(62, '2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core', 1),
	(63, '2023_11_14_033417_change_request_column_in_table_audit_histories', 1),
	(64, '2023_11_17_063408_add_description_column_to_faq_categories_table', 1),
	(65, '2023_12_07_095130_add_color_column_to_media_folders_table', 1),
	(66, '2023_12_12_105220_drop_translations_table', 1),
	(67, '2023_12_17_162208_make_sure_column_color_in_media_folders_nullable', 1),
	(68, '2024_01_16_050056_create_comments_table', 1),
	(69, '2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table', 1),
	(70, '2024_03_25_000001_update_captcha_settings_for_contact', 1),
	(71, '2024_03_25_000001_update_captcha_settings_for_newsletter', 1),
	(72, '2024_04_04_110758_update_value_column_in_user_meta_table', 1),
	(73, '2024_04_19_063914_create_custom_fields_table', 1),
	(74, '2024_04_27_100730_improve_analytics_setting', 1),
	(75, '2024_05_12_091229_add_column_visibility_to_table_media_files', 1),
	(76, '2024_05_16_060328_add_projects_translations_table', 1),
	(77, '2024_07_07_091316_fix_column_url_in_menu_nodes_table', 1),
	(78, '2024_07_12_100000_change_random_hash_for_media', 1),
	(79, '2024_07_30_091615_fix_order_column_in_categories_table', 1),
	(80, '2024_09_09_075552_add_action_field_pf_packages_table', 1),
	(81, '2024_09_30_024515_create_sessions_table', 1),
	(82, '2024_11_14_024038_improve_pf_packages_table', 1),
	(83, '2024_12_19_000001_create_device_tokens_table', 1),
	(84, '2024_12_19_000002_create_push_notifications_table', 1),
	(85, '2024_12_19_000003_create_push_notification_recipients_table', 1),
	(86, '2025_01_06_033807_add_default_value_for_categories_author_type', 1),
	(87, '2025_01_19_145943_add_column_order_to_table_pf_services', 1),
	(88, '2025_02_11_153025_add_action_label_to_announcement_translations', 1),
	(89, '2025_05_05_000001_add_user_type_to_audit_histories_table', 1);

-- Dumping structure for table devfolio.newsletters
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.newsletters: ~0 rows (approximately)

-- Dumping structure for table devfolio.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pages: ~7 rows (approximately)
INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Home', '[hero-banner style=&quot;2&quot; title=&quot;Senior &lt;span&gt;{Full Stack}&lt;/span&gt;Web &amp; App developer&quot; subtitle=&quot;Hey, I&rsquo;m James&quot; description=&quot;With expertise in cutting-edge technologies such as &lt;span&gt;NodeJS&lt;/span&gt;, &lt;span&gt;React&lt;/span&gt;, &lt;span&gt;Angular&lt;/span&gt;, and &lt;span&gt;Laravel&lt;/span&gt;... I deliver web solutions that are both innovative and robust.&quot; primary_button_text=&quot;Download My CV&quot; primary_button_link=&quot;/storage/main/resume/cv.pdf&quot; primary_button_icon=&quot;ti ti-download&quot; below_button_text=&quot;...and more&quot; open_secondary_link_in_the_new_tab=&quot;no&quot; quantity=&quot;5&quot; name_1=&quot;Next.js&quot; image_1=&quot;code/skills/1.png&quot; name_2=&quot;Firebase&quot; image_2=&quot;code/skills/2.png&quot; name_3=&quot;MongoDB&quot; image_3=&quot;code/skills/3.png&quot; name_4=&quot;Node.js&quot; image_4=&quot;code/skills/4.png&quot; name_5=&quot;Tailwind CSS&quot; image_5=&quot;code/skills/5.png&quot; background_image=&quot;code/general/hero-bg.png&quot; background_image_dark=&quot;code/general/hero-bg-dark.png&quot; right_image=&quot;code/general/people.png&quot; right_image_shape=&quot;code/general/people-shape.png&quot; enable_lazy_loading=&quot;no&quot;][/hero-banner]\n[stats-counter style=&quot;2&quot; quantity=&quot;4&quot; label_1=&quot;Years Experience&quot; icon_1=&quot;ti ti-crown&quot; count_1=&quot;12&quot; label_2=&quot;Projects Completed&quot; icon_2=&quot;ti ti-device-desktop&quot; count_2=&quot;250&quot; label_3=&quot;Satisfied Clients&quot; icon_3=&quot;ti ti-heart-spark&quot; count_3=&quot;680&quot; label_4=&quot;Awards Winner&quot; icon_4=&quot;ti ti-award&quot; count_4=&quot;18&quot; background_image=&quot;code/general/static-bg.png&quot; enable_lazy_loading=&quot;no&quot;][/stats-counter]\n[corporation title=&quot;More than +168 &lt;span&gt;companies &lt;br /&gt;&lt;/span&gt; trusted &lt;span&gt;worldwide_&lt;/span&gt;&quot; subtitle=&quot;Cooperation&quot; companies_quantity=&quot;9&quot; companies_name_1=&quot;bravado&quot; companies_image_1=&quot;code/companies/bravado.png&quot; companies_name_2=&quot;gocardless&quot; companies_image_2=&quot;code/companies/gocardless.png&quot; companies_name_3=&quot;google&quot; companies_image_3=&quot;code/companies/google.png&quot; companies_name_4=&quot;intercom&quot; companies_image_4=&quot;code/companies/intercom.png&quot; companies_name_5=&quot;monzo&quot; companies_image_5=&quot;code/companies/monzo.png&quot; companies_name_6=&quot;samsung&quot; companies_image_6=&quot;code/companies/samsung.png&quot; companies_name_7=&quot;spotify&quot; companies_image_7=&quot;code/companies/spotify.png&quot; companies_name_8=&quot;stripe&quot; companies_image_8=&quot;code/companies/stripe.png&quot; companies_name_9=&quot;visa&quot; companies_image_9=&quot;code/companies/visa.png&quot; contact_avatar=&quot;code/general/corporation-avatar.png&quot; journey_title=&quot;Git Journaling&quot; journeys_quantity=&quot;5&quot; journeys_date_1=&quot;15 Jul&quot; journeys_title_1=&quot;Muzzilla-streaming-API-services-for-Python&quot; journeys_date_2=&quot;30 Jun&quot; journeys_title_2=&quot;ChatHub-Chat-application-VueJs-Mongodb&quot; journeys_date_3=&quot;26 May&quot; journeys_title_3=&quot;DineEasy-coffee-tea-reservation-system&quot; journeys_date_4=&quot;17 Apr&quot; journeys_title_4=&quot;FinanceBuddy-Personal-finance-tracker&quot; journeys_date_5=&quot;05 Mar&quot; journeys_title_5=&quot;TuneStream-Music-streaming-service-API&quot; contacts_quantity=&quot;3&quot; contacts_label_1=&quot;skype&quot; contacts_content_1=&quot;james.doe&quot; contacts_url_1=&quot;skype:james.doe?chat&quot; contacts_icon_1=&quot;ti ti-brand-skype&quot; contacts_label_2=&quot;email&quot; contacts_content_2=&quot;contact@botble.com&quot; contacts_url_2=&quot;mailto:contact@botble.com&quot; contacts_icon_2=&quot;ti ti-mail&quot; contacts_label_3=&quot;phone&quot; contacts_content_3=&quot;+1-234-567-8901&quot; contacts_url_3=&quot;tel:+1-234-567-8901&quot; contacts_icon_3=&quot;ti ti-phone&quot; enable_lazy_loading=&quot;yes&quot;][/corporation]\n[services style=&quot;2&quot; title=&quot;Designing solutions &lt;span class=&#039;text-300&#039;&gt;customized&lt;br&gt;to meet your requirements&lt;/span&gt;&quot; subtitle=&quot;Cooperation&quot; service_ids=&quot;1,2,6,3,4,5&quot; bottom_text=&quot;Excited to take on &lt;span class=&#039;text-dark&#039;&gt;new projects&lt;/span&gt; and collaborate. &lt;br&gt;Let\\&#039;s chat about your ideas. &lt;a href=&#039;&#039; class=&#039;text-primary-2&#039;&gt;Reach out!&lt;/a&gt;&quot; enable_lazy_loading=&quot;yes&quot;][/services]\n[experience title=&quot;+12 &lt;span&gt;years of&lt;/span&gt; passion &lt;span&gt;for &lt;br /&gt; programming techniques&lt;/span&gt;&quot; subtitle=&quot;Experience&quot; role_title=&quot;Senior Software Engineer&quot; role_description=&quot;Led development of scalable web applications, &lt;span&gt;improving performance&lt;/span&gt; and user experience for millions of users. \\n Implemented machine learning algorithms to enhance search functionality. \\n Collaborated with cross-functional teams to integrate new features seamlessly.&quot; experiences_quantity=&quot;4&quot; experiences_date_1=&quot;2018 - Present&quot; experiences_title_1=&quot;Google&quot; experiences_logo_1=&quot;code/experiences/google.png&quot; experiences_date_2=&quot;2012 - 2015&quot; experiences_title_2=&quot;Twitter (X)&quot; experiences_logo_2=&quot;code/experiences/x.png&quot; experiences_date_3=&quot;2018 - Present&quot; experiences_title_3=&quot;Amazon&quot; experiences_logo_3=&quot;code/experiences/amazon.png&quot; experiences_date_4=&quot;2010 - 2012&quot; experiences_title_4=&quot;Paypal&quot; experiences_logo_4=&quot;code/experiences/paypal.png&quot; skills_quantity=&quot;5&quot; skills_name_1=&quot;Python&quot; skills_name_2=&quot;TensorFlow&quot; skills_name_3=&quot;Angular&quot; skills_name_4=&quot;Kubernetes&quot; skills_name_5=&quot;GCP&quot; background_image=&quot;code/general/services-bg.png&quot; enable_lazy_loading=&quot;yes&quot;][/experience]\n[resume style=&quot;2&quot; resume_1_title=&quot;Education&quot; resume_1_title_icon=&quot;ti ti-school&quot; resume_1_quantity=&quot;4&quot; resume_1_time_1=&quot;2018 - 2019&quot; resume_1_title_1=&quot;Certification in UX Design&quot; resume_1_subtitle_1=&quot;University of Stanford&quot; resume_1_time_2=&quot;2017 - 2018&quot; resume_1_title_2=&quot;Certification in Web Dev&quot; resume_1_subtitle_2=&quot;University of Stanford&quot; resume_1_time_3=&quot;2014 - 2016&quot; resume_1_title_3=&quot;Advanced UX/UI Bootcamp&quot; resume_1_subtitle_3=&quot;Design Academy&quot; resume_1_time_4=&quot;2012 - 2013&quot; resume_1_title_4=&quot;Certification in Graphic Design&quot; resume_1_subtitle_4=&quot;Coursera&quot; resume_2_title=&quot;Experience&quot; resume_2_title_icon=&quot;ti ti-stars&quot; resume_2_quantity=&quot;4&quot; resume_2_time_1=&quot;2019 - Present&quot; resume_2_title_1=&quot;Senior UI/UX Designer&quot; resume_2_subtitle_1=&quot;Leader in Creative team&quot; resume_2_time_2=&quot;2016 - 2019&quot; resume_2_title_2=&quot;UI/UX Designer&quot; resume_2_subtitle_2=&quot;Tech Startup&quot; resume_2_time_3=&quot;2014 - 2016&quot; resume_2_title_3=&quot;Freelance UI/UX Designer&quot; resume_2_subtitle_3=&quot;Self-Employed&quot; resume_2_time_4=&quot;2012 - 2014&quot; resume_2_title_4=&quot;Junior UI Designer&quot; resume_2_subtitle_4=&quot;Web Solutions team&quot; enable_lazy_loading=&quot;yes&quot;][/resume]\n[projects style=&quot;2&quot; title=&quot;My Recent Works&quot; subtitle=&quot;Projects&quot; project_ids=&quot;1,2,3,4&quot; background_image=&quot;code/general/projects-bg.png&quot; enable_lazy_loading=&quot;yes&quot;][/projects]\n[skills style=&quot;2&quot; title=&quot;My Skills&quot; subtitle=&quot;Projects&quot; quantity=&quot;9&quot; name_1=&quot;Next.js&quot; image_1=&quot;code/skills/1.png&quot; name_2=&quot;Firebase&quot; image_2=&quot;code/skills/2.png&quot; name_3=&quot;MongoDB&quot; image_3=&quot;code/skills/3.png&quot; name_4=&quot;Node.js&quot; image_4=&quot;code/skills/4.png&quot; name_5=&quot;Tailwind CSS&quot; image_5=&quot;code/skills/5.png&quot; name_6=&quot;React&quot; image_6=&quot;code/skills/6.png&quot; name_7=&quot;Vue.js&quot; image_7=&quot;code/skills/7.png&quot; name_8=&quot;Angular&quot; image_8=&quot;code/skills/8.png&quot; name_9=&quot;Laravel&quot; image_9=&quot;code/skills/9.png&quot; list_quantity=&quot;5&quot; list_label_1=&quot;Front-End&quot; list_content_1=&quot;HTML, CSS, JavaScript, React, Angular&quot; list_label_2=&quot;Back-End&quot; list_content_2=&quot;Node.js, Express, Python, Django&quot; list_label_3=&quot;Databases&quot; list_content_3=&quot;MySQL, PostgreSQL, MongoDB&quot; list_label_4=&quot;Tools &amp; Platforms&quot; list_content_4=&quot;Git, Docker, AWS, Heroku&quot; list_label_5=&quot;Others&quot; list_content_5=&quot;RESTful APIs, GraphQL, Agile Methodologies&quot; enable_lazy_loading=&quot;yes&quot;][/skills]\n[blog-posts style=&quot;2&quot; paginate=&quot;3&quot; title=&quot;Recent blog&quot; subtitle=&quot;Latest Posts&quot; enable_lazy_loading=&quot;yes&quot;][/blog-posts]\n[contact-form style=&quot;2&quot; display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email,subject&quot; title=&quot;Let&#039;s connect&quot; quantity=&quot;4&quot; label_1=&quot;Phone&quot; content_1=&quot;+1-234-567-8901&quot; icon_1=&quot;ti ti-phone&quot; url_1=&quot;tel:+1-234-567-8901&quot; label_2=&quot;Email&quot; content_2=&quot;contact@botble.com&quot; icon_2=&quot;ti ti-mail&quot; url_2=&quot;mailto:contact@botble.com&quot; label_3=&quot;X (Twitter)&quot; content_3=&quot;Botble Technologies&quot; icon_3=&quot;ti ti-user&quot; url_3=&quot;https://x.com/botble&quot; label_4=&quot;Address&quot; content_4=&quot;0811 Erdman Prairie, Joaville CA&quot; icon_4=&quot;ti ti-map&quot; url_4=&quot;https://google.com/maps&quot;][/contact-form]', 1, NULL, NULL, NULL, 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(2, 'Services', '[services style=&quot;4&quot; enable_lazy_loading=&quot;no&quot;][/services]', 1, NULL, 'has-heading', '\n                With expertise in mobile app and web design, I transform ideas into visually\n                stunning and user-friendly interfaces that captivate and retain users.\n                Explore my work and see design in action.', 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(3, 'Projects', '[projects style=&quot;4&quot; enable_lazy_loading=&quot;no&quot;][/projects]', 1, NULL, 'has-heading', '\n                With expertise in mobile app and web design, I transform ideas into visually\n                stunning and user-friendly interfaces that captivate and retain users.\n                Explore my work and see design in action.', 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(4, 'Pricing', '[pricing-plans package_ids=&quot;&quot; enable_lazy_loading=&quot;no&quot;][/pricing-plans]\n[faqs title=&quot;Common Questions&quot; category_ids=&quot;&quot; enable_lazy_loading=&quot;no&quot;][/faqs]', 1, NULL, 'has-heading', 'Flexible Plans Tailored to Meet Your Unique Needs, Ensuring High-Quality Services\n                Without Breaking the Bank', 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(5, 'Blog', '', 1, NULL, 'has-heading', 'Discover key insights and emerging trends shaping the future of design: a detailed\n                examination of how these innovations are reshaping our industry', 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(6, 'Contact', '[contact-form style=&quot;2&quot; display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email,subject&quot; title=&quot;Let&#039;s connect&quot; quantity=&quot;4&quot; label_1=&quot;Phone&quot; content_1=&quot;+1-234-567-8901&quot; icon_1=&quot;ti ti-phone&quot; url_1=&quot;tel:+1-234-567-8901&quot; label_2=&quot;Email&quot; content_2=&quot;contact@botble.com&quot; icon_2=&quot;ti ti-mail&quot; url_2=&quot;mailto:contact@botble.com&quot; label_3=&quot;X (Twitter)&quot; content_3=&quot;Botble Technologies&quot; icon_3=&quot;ti ti-user&quot; url_3=&quot;https://x.com/botble&quot; label_4=&quot;Address&quot; content_4=&quot;0811 Erdman Prairie, Joaville CA&quot; icon_4=&quot;ti ti-map&quot; url_4=&quot;https://google.com/maps&quot;][/contact-form]', 1, NULL, 'has-heading', NULL, 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(7, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF "token" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'has-heading', NULL, 'published', '2025-06-25 17:23:21', '2025-06-25 17:23:21');

-- Dumping structure for table devfolio.pages_translations
CREATE TABLE IF NOT EXISTS `pages_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pages_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table devfolio.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_custom_fields
CREATE TABLE IF NOT EXISTS `pf_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_custom_fields_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_custom_fields: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_custom_fields_translations
CREATE TABLE IF NOT EXISTS `pf_custom_fields_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_custom_fields_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`lang_code`,`pf_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_custom_fields_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_custom_field_options
CREATE TABLE IF NOT EXISTS `pf_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_custom_field_options_custom_field_id_index` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_custom_field_options: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_custom_field_options_translations
CREATE TABLE IF NOT EXISTS `pf_custom_field_options_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_custom_field_options_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`lang_code`,`pf_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_custom_field_options_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_packages
CREATE TABLE IF NOT EXISTS `pf_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `annual_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_packages: ~2 rows (approximately)
INSERT INTO `pf_packages` (`id`, `name`, `description`, `content`, `price`, `annual_price`, `duration`, `features`, `status`, `is_popular`, `action_label`, `action_url`, `created_at`, `updated_at`, `order`) VALUES
	(1, 'Basic', 'For small businesses and startups.', '', '$49', NULL, 'hourly', 'Require your wireframe\nDesign using Figma, Framer\nDevelop with Webflow, React, WordPress, Laravel/PHP\nRemote/Online collaboration\nAvailable on business days, no weekends\n6 months of support', 'published', 0, 'Get Started', '/contact', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0),
	(2, 'Business', 'For growing businesses and agencies.', '', '$99', NULL, 'hourly', 'No wireframe needed\nDesign using Figma, Framer\nDevelop with Webflow, React, WordPress, Laravel/PHP\nRemote/Online collaboration\nAvailable on business days, no weekends\n12 months of support\nYour project is always a priority\nCustomer care gifts included', 'published', 0, 'Get Started', '/contact', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0);

-- Dumping structure for table devfolio.pf_packages_translations
CREATE TABLE IF NOT EXISTS `pf_packages_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_packages_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`pf_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_packages_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_projects
CREATE TABLE IF NOT EXISTS `pf_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `views` int NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_projects: ~4 rows (approximately)
INSERT INTO `pf_projects` (`id`, `name`, `description`, `content`, `place`, `client`, `is_featured`, `image`, `images`, `views`, `status`, `created_at`, `updated_at`, `author`, `start_date`, `order`) VALUES
	(1, 'CRM System', 'A custom-built CRM system with real-time data synchronization and multi-user support.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', NULL, 'Corporate Client', 1, 'main/projects/1.png', NULL, 5790, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, '2023-06-01', 0),
	(2, 'E-Learning Platform', 'A scalable e-learning platform with integrated payment and live chat functionalities.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', NULL, 'Education Startup', 0, 'main/projects/2.png', NULL, 8832, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, '2023-03-15', 0),
	(3, 'Mobile Banking App', 'A secure and user-friendly mobile banking app for managing personal finances.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', NULL, 'Finance Company', 1, 'main/projects/3.png', NULL, 8195, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, '2022-09-10', 0),
	(4, 'Cloud Infrastructure Setup', 'Set up a scalable and secure cloud infrastructure with automated monitoring and logging.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', NULL, 'Tech Company', 0, 'main/projects/4.png', NULL, 5792, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', NULL, '2023-04-20', 0);

-- Dumping structure for table devfolio.pf_projects_translations
CREATE TABLE IF NOT EXISTS `pf_projects_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_projects_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_projects_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_quotes
CREATE TABLE IF NOT EXISTS `pf_quotes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_quotes: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_services
CREATE TABLE IF NOT EXISTS `pf_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `views` int NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pf_services_category_id_index` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_services: ~6 rows (approximately)
INSERT INTO `pf_services` (`id`, `category_id`, `name`, `description`, `content`, `is_featured`, `image`, `images`, `views`, `status`, `created_at`, `updated_at`, `order`) VALUES
	(1, 2, 'API Development', 'Designing and developing scalable RESTful APIs for web and mobile applications.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', 0, NULL, NULL, 5719, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0),
	(2, 2, 'Frontend Development', 'Creating dynamic and interactive web pages using React, Vue, and other modern JS frameworks.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', 0, NULL, NULL, 4061, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0),
	(3, 3, 'Mobile App Development', 'Building cross-platform mobile applications using Flutter and React Native.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', 1, NULL, NULL, 2825, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0),
	(4, 3, 'DevOps Consulting', 'Implementing automated pipelines for continuous integration and delivery.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', 0, NULL, NULL, 7188, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0),
	(5, 4, 'Cloud Integration', 'Seamlessly integrating applications with cloud services like AWS, Azure, and Google Cloud.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', 1, NULL, NULL, 4720, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0),
	(6, 2, 'Database Management', 'Managing and optimizing relational and non-relational databases for high performance.', '<h5 class="fs-5 fw-medium">Description</h5>\n<p class="text-300">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class="fs-5 fw-medium mt-4">Key Features</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">User-Centric Interface: <span class="text-300 fw-medium">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Integrated Search and Booking: <span class="text-300 fw-medium">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Personalized Recommendations: <span class="text-300 fw-medium">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">\n            Secure Payment Gateway: <span class="text-300 fw-medium">Integrated a secure payment gateway to ensure that all transactions <span class="text-dark fw-bold">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Interactive Maps: <span class="text-300 fw-medium">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Technologies Used</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Front-End: <span class="text-300 fw-medium">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Back-End: <span class="text-300 fw-medium">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Database: <span class="text-300 fw-medium">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">APIs: <span class="text-300 fw-medium">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Payment Integration: <span class="text-300 fw-medium">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class="fs-5 fw-medium mt-4">Design Highlights</h5>\n<ul>\n    <li>\n        <p class="text-dark fw-bold">Visual Appeal: <span class="text-300 fw-medium">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Usability: <span class="text-300 fw-medium">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class="text-dark fw-bold">Responsive Design: <span class="text-300 fw-medium">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n', 1, NULL, NULL, 837, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18', 0);

-- Dumping structure for table devfolio.pf_services_translations
CREATE TABLE IF NOT EXISTS `pf_services_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_services_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pf_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_services_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.pf_service_categories
CREATE TABLE IF NOT EXISTS `pf_service_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_service_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_service_categories: ~4 rows (approximately)
INSERT INTO `pf_service_categories` (`id`, `parent_id`, `name`, `description`, `image`, `order`, `status`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Backend Development', 'Server-side development with robust, scalable architectures.', NULL, 0, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(2, NULL, 'Frontend Development', 'Building interactive and responsive web interfaces using modern technologies.', NULL, 0, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(3, NULL, 'Mobile App Development', 'Developing cross-platform mobile applications for Android and iOS.', NULL, 0, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(4, NULL, 'DevOps & Cloud', 'Cloud-based services and infrastructure management with CI/CD practices.', NULL, 0, 'published', '2025-06-25 17:23:18', '2025-06-25 17:23:18');

-- Dumping structure for table devfolio.pf_service_categories_translations
CREATE TABLE IF NOT EXISTS `pf_service_categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_service_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`pf_service_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.pf_service_categories_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.posts: ~15 rows (approximately)
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
	(1, 'Building a Full-Stack App with the TALL Stack', 'Learn how to build a full-stack web application using the TALL stack, integrating Laravel, Alpine.js, Tailwind CSS, and Livewire for dynamic and responsive web development.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/9.png', 2036, NULL, '2024-08-30 21:33:19', '2025-06-25 17:23:17'),
	(2, 'My Journey in Open Source: 3 Years of Contributions', 'A personal reflection on my experiences contributing to open source projects over the past three years, sharing lessons learned and advice for aspiring contributors.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'main/posts/3.png', 587, NULL, '2025-05-24 23:35:30', '2025-06-25 17:23:17'),
	(3, '5 Essential Tools for Web Developers in 2024', 'Discover the top 5 tools that are essential for web developers in 2024, from frameworks and libraries to productivity boosters.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/5.png', 779, NULL, '2024-11-07 18:40:48', '2025-06-25 17:23:17'),
	(4, 'How I Built My Personal Portfolio Using Botble CMS', 'A detailed walkthrough on how I built my portfolio website using Botble CMS, customizing it with the Zelio template for an impressive online presence.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'main/posts/9.png', 1347, NULL, '2024-09-03 20:10:25', '2025-06-25 17:23:17'),
	(5, 'Creating Responsive UIs with Tailwind CSS', 'Learn how to create responsive user interfaces quickly and efficiently using the utility-first CSS framework, Tailwind CSS.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/7.png', 2257, NULL, '2024-10-12 11:57:30', '2025-06-25 17:23:17'),
	(6, 'Why I Love Contributing to Open Source Projects', 'A deep dive into why open source matters to me, how it helped me grow as a developer, and why every developer should contribute to open source.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/2.png', 1920, NULL, '2025-02-17 16:22:20', '2025-06-25 17:23:17'),
	(7, 'A Deep Dive into Laravel for Beginners', 'A comprehensive guide for beginners who want to learn Laravel, covering everything from installation to building a simple application.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/2.png', 867, NULL, '2024-08-01 10:43:43', '2025-06-25 17:23:17'),
	(8, 'Exploring the Benefits of MySQL for Large-Scale Projects', 'An exploration of why MySQL is a great choice for large-scale projects, highlighting features, scalability, and performance tips.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'main/posts/7.png', 1635, NULL, '2025-06-17 14:34:32', '2025-06-25 17:23:17'),
	(9, 'How to Integrate APIs in Node.js for Your Next Project', 'Learn how to seamlessly integrate third-party APIs in your Node.js applications for powerful data access and functionality.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/1.png', 2124, NULL, '2025-05-09 14:39:59', '2025-06-25 17:23:17'),
	(10, 'Best Practices for Designing User-Friendly Websites', 'Discover the best practices for designing websites that are not only aesthetically pleasing but also user-friendly and accessible.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/8.png', 470, NULL, '2025-03-03 10:30:53', '2025-06-25 17:23:17'),
	(11, 'Lessons from My First Web Development Job', 'Reflecting on my first web development job, the lessons I learned, the challenges I faced, and how it shaped my career.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/2.png', 250, NULL, '2025-04-11 23:55:27', '2025-06-25 17:23:17'),
	(12, 'How to Contribute to Open Source: A Beginner’s Guide', 'A step-by-step guide on how beginners can start contributing to open source projects, with tips on finding the right project and making meaningful contributions.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'main/posts/2.png', 864, NULL, '2024-08-02 06:14:50', '2025-06-25 17:23:17'),
	(13, 'Optimizing Web Performance with React.js', 'Learn how to optimize your React.js applications for better performance, focusing on code splitting, lazy loading, and efficient state management.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/11.png', 382, NULL, '2025-04-02 13:58:45', '2025-06-25 17:23:17'),
	(14, 'My Top 5 GitHub Projects', 'An overview of my top 5 GitHub projects, showcasing what I’ve built and how they’ve helped me grow as a developer.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'main/posts/10.png', 1761, NULL, '2024-11-14 01:29:01', '2025-06-25 17:23:17'),
	(15, 'Adapting to the New Web Development Trends in 2024', 'A look at the latest trends in web development for 2024, including new technologies, best practices, and what the future holds for developers.', '<h5>Prioritize User-Centric Design</h5>\n<h5 class="fs-5 fw-medium">Understand Your Users</h5>\n<p class="text-300">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class="fs-5 fw-medium">Simplify Navigation</h5>\n<p class="text-300">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class="mt-6">Optimize Performance</h5>\n<h5 class="fs-5 fw-medium">Fast Loading Times</h5>\n<p class="text-300">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class="fs-5 fw-medium">Smooth Animations</h5>\n<p class="text-300">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class="fs-5 fw-medium">Offline Access</h5>\n<p class="text-300">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class="fs-5 fw-medium">Data Protection</h5>\n<p class="text-300">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class="fs-5 fw-medium">Transparent Policies</h5>\n<p class="text-300">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class="fs-5 fw-medium">Regular Updates</h5>\n<p class="text-300">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title="Conclusion" description="Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app."][/highlighted-box]\n', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'main/posts/11.png', 778, NULL, '2024-11-24 05:53:46', '2025-06-25 17:23:17');

-- Dumping structure for table devfolio.posts_translations
CREATE TABLE IF NOT EXISTS `posts_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.posts_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.post_categories
CREATE TABLE IF NOT EXISTS `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.post_categories: ~29 rows (approximately)
INSERT INTO `post_categories` (`category_id`, `post_id`) VALUES
	(7, 1),
	(7, 2),
	(9, 2),
	(7, 3),
	(3, 3),
	(1, 4),
	(8, 4),
	(8, 5),
	(7, 5),
	(5, 6),
	(3, 6),
	(5, 7),
	(3, 7),
	(1, 8),
	(4, 8),
	(6, 9),
	(2, 9),
	(8, 10),
	(2, 10),
	(5, 11),
	(6, 11),
	(8, 12),
	(1, 12),
	(9, 13),
	(8, 13),
	(2, 14),
	(7, 14),
	(1, 15),
	(2, 15);

-- Dumping structure for table devfolio.post_tags
CREATE TABLE IF NOT EXISTS `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.post_tags: ~39 rows (approximately)
INSERT INTO `post_tags` (`tag_id`, `post_id`) VALUES
	(7, 1),
	(2, 1),
	(4, 1),
	(6, 2),
	(8, 2),
	(1, 3),
	(7, 3),
	(1, 4),
	(7, 4),
	(6, 4),
	(2, 5),
	(4, 5),
	(7, 5),
	(3, 6),
	(7, 6),
	(2, 7),
	(8, 7),
	(7, 8),
	(1, 8),
	(7, 9),
	(3, 9),
	(2, 9),
	(1, 10),
	(2, 10),
	(5, 10),
	(2, 11),
	(3, 11),
	(7, 11),
	(5, 12),
	(7, 12),
	(4, 12),
	(4, 13),
	(6, 13),
	(3, 13),
	(8, 14),
	(3, 14),
	(1, 14),
	(1, 15),
	(3, 15);

-- Dumping structure for table devfolio.push_notifications
CREATE TABLE IF NOT EXISTS `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.push_notifications: ~0 rows (approximately)

-- Dumping structure for table devfolio.push_notification_recipients
CREATE TABLE IF NOT EXISTS `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`),
  CONSTRAINT `push_notification_recipients_push_notification_id_foreign` FOREIGN KEY (`push_notification_id`) REFERENCES `push_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.push_notification_recipients: ~0 rows (approximately)

-- Dumping structure for table devfolio.request_logs
CREATE TABLE IF NOT EXISTS `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.request_logs: ~0 rows (approximately)

-- Dumping structure for table devfolio.revisions
CREATE TABLE IF NOT EXISTS `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.revisions: ~0 rows (approximately)

-- Dumping structure for table devfolio.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.roles: ~0 rows (approximately)
INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Admin', '{"users.index":true,"users.create":true,"users.edit":true,"users.destroy":true,"roles.index":true,"roles.create":true,"roles.edit":true,"roles.destroy":true,"core.system":true,"core.cms":true,"core.manage.license":true,"systems.cronjob":true,"core.tools":true,"tools.data-synchronize":true,"media.index":true,"files.index":true,"files.create":true,"files.edit":true,"files.trash":true,"files.destroy":true,"folders.index":true,"folders.create":true,"folders.edit":true,"folders.trash":true,"folders.destroy":true,"settings.index":true,"settings.common":true,"settings.options":true,"settings.email":true,"settings.media":true,"settings.admin-appearance":true,"settings.cache":true,"settings.datatables":true,"settings.email.rules":true,"settings.others":true,"menus.index":true,"menus.create":true,"menus.edit":true,"menus.destroy":true,"optimize.settings":true,"pages.index":true,"pages.create":true,"pages.edit":true,"pages.destroy":true,"plugins.index":true,"plugins.edit":true,"plugins.remove":true,"plugins.marketplace":true,"sitemap.settings":true,"core.appearance":true,"theme.index":true,"theme.activate":true,"theme.remove":true,"theme.options":true,"theme.custom-css":true,"theme.custom-js":true,"theme.custom-html":true,"theme.robots-txt":true,"settings.website-tracking":true,"widgets.index":true,"analytics.general":true,"analytics.page":true,"analytics.browser":true,"analytics.referrer":true,"analytics.settings":true,"announcements.index":true,"announcements.create":true,"announcements.edit":true,"announcements.destroy":true,"announcements.settings":true,"audit-log.index":true,"audit-log.destroy":true,"backups.index":true,"backups.create":true,"backups.restore":true,"backups.destroy":true,"plugins.blog":true,"posts.index":true,"posts.create":true,"posts.edit":true,"posts.destroy":true,"categories.index":true,"categories.create":true,"categories.edit":true,"categories.destroy":true,"tags.index":true,"tags.create":true,"tags.edit":true,"tags.destroy":true,"blog.settings":true,"posts.export":true,"posts.import":true,"captcha.settings":true,"contacts.index":true,"contacts.edit":true,"contacts.destroy":true,"contact.custom-fields":true,"contact.settings":true,"plugin.faq":true,"faq.index":true,"faq.create":true,"faq.edit":true,"faq.destroy":true,"faq_category.index":true,"faq_category.create":true,"faq_category.edit":true,"faq_category.destroy":true,"faqs.settings":true,"fob-comment.index":true,"fob-comment.comments.index":true,"fob-comment.comments.edit":true,"fob-comment.comments.destroy":true,"fob-comment.comments.reply":true,"fob-comment.settings":true,"galleries.index":true,"galleries.create":true,"galleries.edit":true,"galleries.destroy":true,"languages.index":true,"languages.create":true,"languages.edit":true,"languages.destroy":true,"translations.import":true,"translations.export":true,"property-translations.import":true,"property-translations.export":true,"newsletter.index":true,"newsletter.destroy":true,"newsletter.settings":true,"plugins.portfolio":true,"portfolio.projects.index":true,"portfolio.projects.create":true,"portfolio.projects.edit":true,"portfolio.projects.destroy":true,"portfolio.service-categories.index":true,"portfolio.service-categories.create":true,"portfolio.service-categories.edit":true,"portfolio.service-categories.destroy":true,"portfolio.services.index":true,"portfolio.services.create":true,"portfolio.services.edit":true,"portfolio.services.destroy":true,"portfolio.packages.index":true,"portfolio.packages.create":true,"portfolio.packages.edit":true,"portfolio.packages.destroy":true,"portfolio.quotation-requests.index":true,"portfolio.quotation-requests.create":true,"portfolio.quotation-requests.edit":true,"portfolio.quotation-requests.destroy":true,"portfolio.custom-fields.index":true,"portfolio.custom-fields.create":true,"portfolio.custom-fields.edit":true,"portfolio.custom-fields.destroy":true,"request-log.index":true,"request-log.destroy":true,"testimonial.index":true,"testimonial.create":true,"testimonial.edit":true,"testimonial.destroy":true,"plugins.translation":true,"translations.locales":true,"translations.theme-translations":true,"translations.index":true,"theme-translations.export":true,"other-translations.export":true,"theme-translations.import":true,"other-translations.import":true,"api.settings":true,"api.sanctum-token.index":true,"api.sanctum-token.create":true,"api.sanctum-token.destroy":true}', 'Admin users role', 1, 1, 1, '2025-06-25 17:23:16', '2025-06-25 17:23:16');

-- Dumping structure for table devfolio.role_users
CREATE TABLE IF NOT EXISTS `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.role_users: ~0 rows (approximately)

-- Dumping structure for table devfolio.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.sessions: ~0 rows (approximately)

-- Dumping structure for table devfolio.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.settings: ~35 rows (approximately)
INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'media_random_hash', '044055889f96465604025a7a06976fad', NULL, '2025-08-02 22:21:49'),
	(2, 'api_enabled', '0', NULL, '2025-08-02 22:21:49'),
	(3, 'activated_plugins', '["language","language-advanced","analytics","announcement","audit-log","backup","blog","captcha","contact","cookie-consent","faq","fob-comment","gallery","newsletter","portfolio","request-log","rss-feed","testimonial","translation"]', NULL, '2025-08-02 22:21:49'),
	(4, 'theme', 'zelio', NULL, '2025-08-02 22:21:49'),
	(5, 'show_admin_bar', '1', NULL, '2025-08-02 22:21:49'),
	(6, 'language_hide_default', '1', NULL, '2025-08-02 22:21:49'),
	(7, 'language_switcher_display', 'dropdown', NULL, '2025-08-02 22:21:49'),
	(8, 'language_display', 'all', NULL, '2025-08-02 22:21:49'),
	(9, 'language_hide_languages', '[]', NULL, '2025-08-02 22:21:49'),
	(10, 'theme-zelio-favicon', 'code/general/favicon.png', NULL, '2025-08-02 22:21:49'),
	(11, 'theme-zelio-logo', 'code/general/favicon.png', NULL, '2025-08-02 22:21:49'),
	(12, 'theme-zelio-logo_dark', 'code/general/favicon.png', NULL, '2025-08-02 22:21:49'),
	(13, 'theme-zelio-site_title', 'Web & App developer', NULL, '2025-08-02 22:21:49'),
	(14, 'theme-zelio-site_name', 'James.dev', NULL, '2025-08-02 22:21:49'),
	(15, 'theme-zelio-seo_description', 'Discover innovative designs, creative projects, and unique artistic works. Showcasing the expertise and vision behind every creation.', NULL, '2025-08-02 22:21:49'),
	(16, 'theme-zelio-tp_primary_font', 'DM Mono', NULL, '2025-08-02 22:21:49'),
	(17, 'theme-zelio-primary_color', 'rgb(111, 168, 220)', NULL, '2025-08-02 22:21:49'),
	(18, 'theme-zelio-gradient_color', 'rgb(111, 168, 220)', NULL, '2025-08-02 22:21:49'),
	(19, 'theme-zelio-homepage_id', '1', NULL, '2025-08-02 22:21:49'),
	(20, 'theme-zelio-social_links', '[[{"key":"name","value":"Facebook"},{"key":"icon","value":"ti ti-brand-facebook"},{"key":"url","value":"https:\\/\\/www.facebook.com"}],[{"key":"name","value":"X (Twitter)"},{"key":"icon","value":"ti ti-brand-x"},{"key":"url","value":"https:\\/\\/x.com"}],[{"key":"name","value":"YouTube"},{"key":"icon","value":"ti ti-brand-youtube"},{"key":"url","value":"https:\\/\\/www.youtube.com"}],[{"key":"name","value":"Instagram"},{"key":"icon","value":"ti ti-brand-linkedin"},{"key":"url","value":"https:\\/\\/www.linkedin.com"}]]', NULL, '2025-08-02 22:21:49'),
	(21, 'theme-zelio-copyright', '© %Y All Rights Reserved by <a href="https://botble.com" class="text-primary">botble.com</a>.', NULL, '2025-08-02 22:21:49'),
	(22, 'theme-zelio-preloader_enabled', 'yes', NULL, '2025-08-02 22:21:49'),
	(23, 'theme-zelio-preloader_version', 'v2', NULL, '2025-08-02 22:21:49'),
	(24, 'theme-zelio-footer_background', 'code/general/footer-bg.png', NULL, '2025-08-02 22:21:49'),
	(25, 'theme-zelio-header_style', '2', NULL, '2025-08-02 22:21:49'),
	(26, 'theme-zelio-footer_style', '2', NULL, '2025-08-02 22:21:49'),
	(27, 'theme-zelio-preloader_style', '1', NULL, '2025-08-02 22:21:49'),
	(28, 'theme-zelio-blog_page_id', '5', NULL, '2025-08-02 22:21:49'),
	(29, 'theme-zelio-post_item_style', '2', NULL, '2025-08-02 22:21:49'),
	(30, 'theme-zelio-post_item_per_row', '3', NULL, '2025-08-02 22:21:49'),
	(31, 'theme-zelio-cookie_consent_learn_more_url', '/cookie-policy', NULL, '2025-08-02 22:21:49'),
	(32, 'theme-zelio-cookie_consent_learn_more_text', 'Cookie Policy', NULL, '2025-08-02 22:21:49'),
	(33, 'licensed_to', 'xxxxx', NULL, '2025-08-02 22:21:49'),
	(34, 'theme-zelio-default_theme_color_mode', 'dark', NULL, '2025-08-02 22:21:49'),
	(35, 'theme-zelio-hide_theme_mode_switcher', 'yes', NULL, '2025-08-02 22:21:49');

-- Dumping structure for table devfolio.slugs
CREATE TABLE IF NOT EXISTS `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.slugs: ~57 rows (approximately)
INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
	(1, 'web-development', 1, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(2, 'open-source-contributions', 2, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(3, 'tutorials', 3, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(4, 'technology-reviews', 4, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(5, 'personal-blog', 5, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(6, 'career-journey', 6, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(7, 'coding-challenges', 7, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(8, 'design-portfolio', 8, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(9, 'collaborations', 9, 'Botble\\Blog\\Models\\Category', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(10, 'botble-cms', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(11, 'javascript', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(12, 'open-source', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(13, 'web-design', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(14, 'api-development', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(15, 'full-stack-development', 6, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(16, 'vietnam-developer', 7, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(17, 'github-projects', 8, 'Botble\\Blog\\Models\\Tag', 'tag', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(18, 'building-a-full-stack-app-with-the-tall-stack', 1, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(19, 'my-journey-in-open-source-3-years-of-contributions', 2, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(20, '5-essential-tools-for-web-developers-in-2024', 3, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(21, 'how-i-built-my-personal-portfolio-using-botble-cms', 4, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(22, 'creating-responsive-uis-with-tailwind-css', 5, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(23, 'why-i-love-contributing-to-open-source-projects', 6, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(24, 'a-deep-dive-into-laravel-for-beginners', 7, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(25, 'exploring-the-benefits-of-mysql-for-large-scale-projects', 8, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(26, 'how-to-integrate-apis-in-nodejs-for-your-next-project', 9, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(27, 'best-practices-for-designing-user-friendly-websites', 10, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(28, 'lessons-from-my-first-web-development-job', 11, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(29, 'how-to-contribute-to-open-source-a-beginners-guide', 12, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(30, 'optimizing-web-performance-with-reactjs', 13, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(31, 'my-top-5-github-projects', 14, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(32, 'adapting-to-the-new-web-development-trends-in-2024', 15, 'Botble\\Blog\\Models\\Post', '', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(33, 'api-development', 1, 'Botble\\Portfolio\\Models\\Service', 'services', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(34, 'frontend-development', 2, 'Botble\\Portfolio\\Models\\Service', 'services', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(35, 'mobile-app-development', 3, 'Botble\\Portfolio\\Models\\Service', 'services', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(36, 'devops-consulting', 4, 'Botble\\Portfolio\\Models\\Service', 'services', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(37, 'cloud-integration', 5, 'Botble\\Portfolio\\Models\\Service', 'services', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(38, 'database-management', 6, 'Botble\\Portfolio\\Models\\Service', 'services', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(39, 'crm-system', 1, 'Botble\\Portfolio\\Models\\Project', 'projects', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(40, 'e-learning-platform', 2, 'Botble\\Portfolio\\Models\\Project', 'projects', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(41, 'mobile-banking-app', 3, 'Botble\\Portfolio\\Models\\Project', 'projects', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(42, 'cloud-infrastructure-setup', 4, 'Botble\\Portfolio\\Models\\Project', 'projects', '2025-06-25 17:23:18', '2025-06-25 17:23:18'),
	(43, 'home', 1, 'Botble\\Page\\Models\\Page', '', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(44, 'services', 2, 'Botble\\Page\\Models\\Page', '', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(45, 'projects', 3, 'Botble\\Page\\Models\\Page', '', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(46, 'pricing', 4, 'Botble\\Page\\Models\\Page', '', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(47, 'blog', 5, 'Botble\\Page\\Models\\Page', '', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(48, 'contact', 6, 'Botble\\Page\\Models\\Page', '', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(49, 'cookie-policy', 7, 'Botble\\Page\\Models\\Page', '', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(50, 'perfect', 1, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(51, 'new-day', 2, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(52, 'happy-day', 3, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(53, 'nature', 4, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(54, 'morning', 5, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(55, 'sunset', 6, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(56, 'ocean-views', 7, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22'),
	(57, 'adventure-time', 8, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2025-06-25 17:23:22', '2025-06-25 17:23:22');

-- Dumping structure for table devfolio.slugs_translations
CREATE TABLE IF NOT EXISTS `slugs_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.slugs_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.tags: ~8 rows (approximately)
INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Botble CMS', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(2, 'JavaScript', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(3, 'Open Source', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(4, 'Web Design', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(5, 'API Development', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(6, 'Full Stack Development', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(7, 'Vietnam Developer', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(8, 'GitHub Projects', 1, 'Botble\\ACL\\Models\\User', NULL, 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17');

-- Dumping structure for table devfolio.tags_translations
CREATE TABLE IF NOT EXISTS `tags_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.tags_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.testimonials
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.testimonials: ~4 rows (approximately)
INSERT INTO `testimonials` (`id`, `name`, `content`, `image`, `company`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Jennifer Lee', '“Working with this team was an absolute pleasure. Their attention to detail, professionalism, and understanding of my needs made the entire home buying process stress-free and enjoyable.”', 'main/avatars/1.png', 'Happy Home Seeker', 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(2, 'Robert Evans', '“The guidance and insights provided by this team were invaluable in helping me secure profitable investments. Their market knowledge and dedication to client success are unmatched.”', 'main/avatars/2.png', 'Property Investor', 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(3, 'Jessica White', '“I couldn’t have asked for a smoother selling experience. Their expert advice, flawless staging, and negotiation skills resulted in a quick sale at a great price. Truly impressive!”', 'main/avatars/1.png', 'Delighted Home Seller', 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17'),
	(4, 'Daniel Miller', '“From start to finish, the home buying experience was handled with care and professionalism. The team listened to all my concerns and helped me find the perfect home in no time.”', 'main/avatars/1.png', 'Happy New Homeowner', 'published', '2025-06-25 17:23:17', '2025-06-25 17:23:17');

-- Dumping structure for table devfolio.testimonials_translations
CREATE TABLE IF NOT EXISTS `testimonials_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.testimonials_translations: ~0 rows (approximately)

-- Dumping structure for table devfolio.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
	(1, 'aqiboffice007@gmail.com', NULL, '$2y$12$nyPAJgKsu76T7R9sM8Ei/.R3z3eOk43whjuHix3FABI41xNZUQxDS', NULL, '2025-08-02 21:56:18', '2025-08-02 21:56:18', 'Aqib', 'Mehedi', 'aqibmehedi007', NULL, 1, 1, NULL, '2025-08-02 21:56:18');

-- Dumping structure for table devfolio.user_meta
CREATE TABLE IF NOT EXISTS `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.user_meta: ~0 rows (approximately)

-- Dumping structure for table devfolio.widgets
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devfolio.widgets: ~6 rows (approximately)
INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
	(1, 'ContactInformationWidget', 'sidebar_panel_sidebar', 'zelio', 1, '{"bio":"I\'m always excited to take on new projects and collaborate with innovative minds.","details":{"Phone":[{"key":"label","value":"Phone"},{"key":"value","value":"+1 234 567 890"}],"Email":[{"key":"label","value":"Email"},{"key":"value","value":"contact@botble.com"}],"Website":[{"key":"label","value":"Website"},{"key":"value","value":"https:\\/\\/botble.com"}],"Address":[{"key":"label","value":"Address"},{"key":"value","value":"123 Main Street, New York, NY 10001"}]}}', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(2, 'SocialLinkWidget', 'sidebar_panel_sidebar', 'zelio', 2, '{"name":"Social"}', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(3, 'LanguageSwitcherWidget', 'sidebar_panel_sidebar', 'zelio', 3, '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(4, 'SiteLogoWidget', 'footer_sidebar', 'zelio', 1, '[]', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(5, 'SocialLinkWidget', 'footer_sidebar', 'zelio', 2, '{"name":"Social"}', '2025-06-25 17:23:21', '2025-06-25 17:23:21'),
	(6, 'Botble\\Widget\\Widgets\\CoreSimpleMenu', 'footer_sidebar', 'zelio', 3, '{"id":"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu","items":[[{"key":"label","value":"Home"},{"key":"url","value":"http:\\/\\/zelio.test\\/home"}],[{"key":"label","value":"Services"},{"key":"url","value":"http:\\/\\/zelio.test\\/services"}],[{"key":"label","value":"Pricing"},{"key":"url","value":"http:\\/\\/zelio.test\\/pricing"}],[{"key":"label","value":"Blog"},{"key":"url","value":"http:\\/\\/zelio.test\\/blog"}],[{"key":"label","value":"Contact"},{"key":"url","value":"http:\\/\\/zelio.test\\/contact"}]]}', '2025-06-25 17:23:21', '2025-06-25 17:23:21');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
