import 'package:namste_jharkhand/logic/login_logic.dart';
import 'package:namste_jharkhand/common_libs.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> with SingleTickerProviderStateMixin {
  bool isLogin = true;
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedRole = 'customer'; // Default role
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _isDisposed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isDisposed && mounted) {
        try {
          _animationController.forward();
        } catch (e) {}
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleLoginSignup() {
    if (mounted) {
      setState(() {
        isLogin = !isLogin;
        _animationController.reset();
        _animationController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: $styles.colors.offWhite,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 30),
                  _buildLogo(colors),
                  const SizedBox(height: 10),
                  _buildHeader(colors),
                  const SizedBox(height: 16),
                  Expanded(
                      child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                              position: _slideAnimation,
                              child: ScaleTransition(
                                  scale: _scaleAnimation,
                                  child: SingleChildScrollView(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                    if (!isLogin)
                                      _buildTextField(
                                          controller: _nameController,
                                          hint: $strings.loginFullNameLabel,
                                          icon: Icons.person),
                                    if (!isLogin) const SizedBox(height: 16),
                                    if (!isLogin) _buildPhoneField(),
                                    if (!isLogin) const SizedBox(height: 16),
                                    if (!isLogin) _buildRoleDropdown(),
                                    if (!isLogin) const SizedBox(height: 16),
                                    _buildTextField(
                                        controller: _emailController,
                                        hint: $strings.loginEmailLabel,
                                        icon: Icons.email),
                                    const SizedBox(height: 16),
                                    _buildTextField(
                                        controller: _passwordController,
                                        hint: $strings.loginPasswordLabel,
                                        icon: Icons.lock,
                                        isPassword: true),
                                    const SizedBox(height: 24),
                                    _buildActionButton(colors),
                                    if (isLogin) _buildForgotPassword(colors),
                                    _buildToggleButton(colors),
                                    const SizedBox(height: 24),
                                    if (isLogin) _buildGoogleLogin(colors)
                                  ]))))))
                ]))));
  }

  Widget _buildHeader(ColorScheme colors) => FadeTransition(
      opacity: _fadeAnimation,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(isLogin ? $strings.loginWelcomeBack : $strings.loginCreateAccount,
            style: $styles.text.h2.copyWith(color: $styles.colors.greyStrong)),
        const SizedBox(height: 8),
        Text(
            isLogin
                ? 'Enter your email address and password to get access your account'
                : 'Please enter valid information to access your account.',
            style: $styles.text.bodySmall.copyWith(color: $styles.colors.caption))
      ]));

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hint,
      required IconData icon,
      bool isPassword = false,
      String? Function(String?)? validator}) {
    return Builder(builder: (context) {
      final colors = Theme.of(context).colorScheme;
      return Container(
          decoration: BoxDecoration(
              color: $styles.colors.offWhite,
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: _isFocused ? $styles.colors.accent1 : $styles.colors.greyMedium.withOpacity(0.3))),
          child: TextFormField(
              cursorColor: $styles.colors.accent1,
              controller: controller,
              obscureText: isPassword && _obscureText,
              validator: validator,
              style: $styles.text.bodySmall.copyWith(color: $styles.colors.body),
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              onTap: () => setState(() => _isFocused = true),
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: $styles.text.bodySmall.copyWith(color: $styles.colors.caption),
                  prefixIcon: Icon(icon, color: $styles.colors.caption),
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
                              color: _isFocused ? $styles.colors.accent1 : colors.onSurface.withOpacity(0.5)),
                          onPressed: () {
                            if (mounted) {
                              setState(() => _obscureText = !_obscureText);
                            }
                          })
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  errorStyle: $styles.text.caption.copyWith(color: Colors.red)),
              onChanged: (_) => setState(() => _isFocused = false)));
    });
  }

  Widget _buildPhoneField() {
    return Builder(builder: (context) {
      return Container(
          decoration: BoxDecoration(
              color: $styles.colors.offWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: $styles.colors.greyMedium.withOpacity(0.3))),
          child: Row(children: [
            Container(
                padding: const EdgeInsets.only(left: 16), child: Icon(Icons.phone, color: $styles.colors.caption)),
            Expanded(
                child: TextField(
                    controller: _phoneController,
                    style: $styles.text.bodySmall.copyWith(color: $styles.colors.body),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: $strings.loginPhoneLabel,
                        hintStyle: $styles.text.bodySmall.copyWith(color: $styles.colors.caption),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16))))
          ]));
    });
  }

  Widget _buildRoleDropdown() {
    final roles = {
      'customer': $strings.loginRoleCustomer,
      'guide': $strings.loginRoleGuide,
      'merchant': $strings.loginRoleMerchant,
      'admin': $strings.loginRoleAdmin,
    };

    return Container(
      decoration: BoxDecoration(
        color: $styles.colors.offWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: $styles.colors.greyMedium.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Icon(Icons.work_outline, color: $styles.colors.caption),
          ),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: InputDecoration(
                hintText: $strings.loginUserRoleLabel,
                hintStyle: $styles.text.bodySmall.copyWith(color: $styles.colors.caption),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              style: $styles.text.bodySmall.copyWith(color: $styles.colors.body),
              dropdownColor: $styles.colors.offWhite,
              items: roles.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(
                    entry.value,
                    style: $styles.text.bodySmall.copyWith(color: $styles.colors.body),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedRole = newValue;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword(ColorScheme colors) => Align(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {},
          child: Text($strings.loginForgotPassword,
              style: $styles.text.bodySmall.copyWith(color: $styles.colors.accent1, fontWeight: FontWeight.bold))));

  Widget _buildLogo(ColorScheme colors) => ScaleTransition(
      scale: _scaleAnimation,
      child: SizedBox(
          width: 150,
          child: ClipOval(
              child: AppImage(image: AssetImage('assets/images/_common/app-logo.png'), fit: BoxFit.fitHeight))));

  Widget _buildActionButton(ColorScheme colors) {
    final authLoadingProvider = Provider.of<AuthLoadingProvider>(context, listen: false);
    AuthManager(loadingProvider: authLoadingProvider);
    return ElevatedButton(
        onPressed: () async {
          if (isLogin && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
            AuthManager(loadingProvider: authLoadingProvider)
                .emailpassLogin(_emailController.text, _passwordController.text, context);
          }
          if (!isLogin &&
              _emailController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty &&
              _phoneController.text.isNotEmpty &&
              _nameController.text.isNotEmpty) {
            AuthManager(loadingProvider: authLoadingProvider).emailpassSignup(_nameController.text,
                _phoneController.text, _emailController.text, _passwordController.text, _selectedRole, context);
          }
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: $styles.colors.white,
            backgroundColor: $styles.colors.accent1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 16)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(isLogin ? $strings.loginSignInButton : $strings.loginSignUpButton,
              style: $styles.text.btn.copyWith(fontSize: 16, color: $styles.colors.white))
        ]));
  }

  Widget _buildGoogleLogin(ColorScheme colors) {
    final authLoadingProvider = Provider.of<AuthLoadingProvider>(context, listen: false);
    AuthManager(loadingProvider: authLoadingProvider);
    return Center(
        child: GestureDetector(
            onTap: () => AuthManager(loadingProvider: authLoadingProvider).implementGoogleSignIn(context),
            child: SizedBox(
                width: 300,
                height: 50,
                child: AppImage(image: AssetImage('assets/images/_common/google.png'), fit: BoxFit.contain))));
  }

  Widget _buildToggleButton(ColorScheme colors) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(isLogin ? $strings.loginSwitchToSignUp : $strings.loginSwitchToSignIn,
            style: $styles.text.bodySmall.copyWith(color: $styles.colors.caption)),
        TextButton(
            onPressed: _toggleLoginSignup,
            child: Text(isLogin ? $strings.loginSignUpButton : $strings.loginSignInButton,
                style: $styles.text.bodySmallBold.copyWith(color: $styles.colors.accent1)))
      ]);
}
