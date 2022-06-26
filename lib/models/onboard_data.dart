class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
     this.title,
     this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\n education managment',
    image: 'assets/images/onboarding_image_1.png',
  ),
  OnBoarding(
    title: 'Create new habits easily',
    image: 'assets/images/onboarding_image_2.png',
  ),
  OnBoarding(
    title: 'Keep track of your progress',
    image: 'assets/images/onboarding_image_3.png',
  ),
  OnBoarding(
    title: 'Join a supportive community',
    image: 'assets/images/onboarding_image_4.png',
  ),
];
