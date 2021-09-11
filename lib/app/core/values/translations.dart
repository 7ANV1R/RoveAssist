import 'package:get/get.dart';

//TODO: implement own translation

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'welcome': 'Welcome to\nLinkpoint.',
          //login and registration
          'connect_with_facebook': 'Connect with Facebook',
          'connect_with_google': 'Connect with Goolge',
          'connect_with_linkedin': 'Connect with LinkedIn',
          'login_with_email': 'Login with email',
          'other_login_options': 'Other login options',
          'dont_have_account': "I don't have an account yet",
          'already_have_account': "Already have an account?",
          'create_account': 'Create an account',
          'create_user_details': 'Create user details',
          //Form related
          'username': 'Username',
          'email': 'Email',
          'password': 'Password',
          'confirm_password': 'Confirm password',
          'first_name': 'First name',
          'last_name': 'Last name',
          'birth_date': 'Birth date',
          'full_address': 'Full address',
          'phone': 'Phone',
          'login': 'Login',
          'signup': 'Sign Up',
          'forgot_password': 'Forgot Password',
          'show': 'Show',
          'hide': 'Hide',
          'cancel': 'Cancel',
          'continue': 'Continue',
          //form validations:
          'username_required': 'Username is required',
          'password_required': 'Password is required',
          'password_min_length': 'Password must be at least 8 charecters long',
          'password_pattern':
              'Passwords must have at least one special character, one number and one uppercase letter',
          'password_not_match': 'Passwords not matched',
          'email_required': 'Email is required',
          'email_invalid': 'Your email is invalid',
          'first_name_required': 'First name is required',
          'last_name_required': 'Last name is required',
          'birth_date_required': 'Birth date is required',
          'full_address_required': 'Full address is required',
          'phone_required': 'Phone is required',
          //navigation drawer:
          'profile': 'Profile',
          'translation': 'Translation',
          'settings': 'Settings',
          'logout': 'Logout',
          //bottom navigation bar:
          'home': 'Home',
          //Settings:
          'theme': 'Theme',
          'language': 'Language',
        },
        'bn_BD': {
          'hello': 'ওহে বিশ্ব',

          //form validations:
          'username_required': 'ইউজার নাম দরকার',
          'password_required': 'পাসওয়ার্ড প্রয়োজন',
          'password_min_length': 'পাসওয়ার্ড কমপক্ষে ৮ টি অক্ষরের দীর্ঘ হওয়া উচিত',
          'password_pattern': 'পাসওয়ার্ডে কমপক্ষে একটি বিশেষ অক্ষর, একটি নম্বর এবং একটি বড় অক্ষর থাকতে হবে',
          'password_not_match': 'পাসওয়ার্ড মেলে না',
          'email_required': 'ইমেল প্রয়োজন',
          'first_name_required': 'প্রথম নাম প্রয়োজন',
          'last_name_required': 'পদবি প্রয়োজন',
          'birth_date_required': 'জন্ম তারিখ প্রয়োজন',
          'full_address_required': 'সম্পূর্ণ ঠিকানা প্রয়োজন',
          'phone_required': 'ফোন প্রয়োজন',
          //navigation drawer:
          'profile': 'প্রোফাইল',
          'settings': 'সেটিংস',
          'logout': 'প্রস্থান',
          //bottom navigation bar:
          'home': 'হোম',
          'vouchers': 'ভাউচার',
          'diary': 'ডায়েরি',
          'digital_guide': 'ডিজিটাল গাইড',
          'more': 'আরও',
          //Settings:
          'theme': 'থিম',
          'language': 'ভাষা',
        }
      };
}
