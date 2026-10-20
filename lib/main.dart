
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NoorEIslamApp());
}

const Color emerald = Color(0xFF064E3B);
const Color gold = Color(0xFFD4AF37);
const Color background = Color(0xFF07110E);

class NoorEIslamApp extends StatelessWidget {
  const NoorEIslamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noor-e-Islam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: emerald,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Map<String, Object>> features = [
    {'icon': Icons.access_time, 'title': 'Namaz Times'},
    {'icon': Icons.explore, 'title': 'Qibla Compass'},
    {'icon': Icons.calendar_month, 'title': 'Hijri Calendar'},
    {'icon': Icons.fingerprint, 'title': 'Digital Tasbeeh'},
    {'icon': Icons.volunteer_activism, 'title': 'Daily Duas'},
    {'icon': Icons.stars, 'title': '99 Names of Allah'},
    {'icon': Icons.calculate, 'title': 'Zakat Calculator'},
    {'icon': Icons.check_circle_outline, 'title': 'Good Deeds'},
  ];

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Row(
          children: [
            Icon(Icons.mosque, color: gold, size: 30),
            SizedBox(width: 10),
            Text(
              'Noor-e-Islam',
              style: TextStyle(
                color: gold,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => showMessage('Settings coming soon'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF065F46), emerald],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: gold.withOpacity(0.6),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'السلام عليكم',
                    style: TextStyle(fontSize: 27, color: gold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Assalamu Alaikum',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'May your day be filled with peace and blessings.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Icon(Icons.favorite, color: gold),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Remember Allah throughout your day',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            const Text(
              'Your Islamic Companion',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Useful tools for your daily worship',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 18),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: features.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 1.12,
              ),
              itemBuilder: (context, index) {
                final feature = features[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => showMessage(
                    '${feature['title']} will be added in the next steps.',
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10251D),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: gold.withOpacity(0.35),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          feature['icon'] as IconData,
                          color: gold,
                          size: 34,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          feature['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Built with care • Noor-e-Islam',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF10251D),
        indicatorColor: emerald,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
          if (index != 0) {
            showMessage(
              '${['Home', 'Worship', 'Calendar', 'Profile'][index]} '
              'section will be developed next.',
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Worship',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
