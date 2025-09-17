import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place_recommendation.dart';
import 'dart:math';

class PlaceDetailsSheet extends StatefulWidget {
  final PlaceRecommendation place;
  final VoidCallback? onNavigate;
  final VoidCallback? onClose;

  const PlaceDetailsSheet({super.key, required this.place, this.onNavigate, this.onClose});

  @override
  State<PlaceDetailsSheet> createState() => _PlaceDetailsSheetState();
}

class _PlaceDetailsSheetState extends State<PlaceDetailsSheet> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  PlaceInfo? _detailedInfo;
  List<PlaceReview> _reviews = [];
  bool _isLoading = true;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    _slideAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuart));
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
    _loadDetailedInfo();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadDetailedInfo() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate API call - in real app, fetch from Places API
      await Future.delayed(const Duration(milliseconds: 800));

      _detailedInfo = _generateDetailedInfo();
      _reviews = _generateReviews();
    } catch (e) {
      print('Error loading place details: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  PlaceInfo _generateDetailedInfo() {
    // Generate comprehensive place information
    final types = widget.place.types;
    final isRestaurant = types.contains('restaurant') || types.contains('food');
    final isAttraction = types.contains('tourist_attraction');
    final isShopping = types.contains('shopping_mall') || types.contains('store');

    return PlaceInfo(
      placeId: widget.place.placeId,
      name: widget.place.name,
      address: widget.place.address,
      location: widget.place.location,
      rating: widget.place.rating,
      priceLevel: widget.place.priceLevel,
      phoneNumber: _generatePhoneNumber(),
      website: _generateWebsite(),
      openingHours: _generateOpeningHours(),
      types: widget.place.types,
      openNow: widget.place.openNow,
      businessStatus: widget.place.openNow ? 'OPERATIONAL' : 'CLOSED_TEMPORARILY',
      userRatingsTotal: 50 + Random().nextInt(500),
      description: _generateDescription(isRestaurant, isAttraction, isShopping),
      amenities: _generateAmenities(isRestaurant, isAttraction, isShopping),
      popularTimes: _generatePopularTimes(),
    );
  }

  String _generatePhoneNumber() {
    final phoneNumbers = ['+91 651 234 5678', '+91 651 876 5432', '+91 651 345 6789', '+91 651 567 8901'];
    return phoneNumbers[Random().nextInt(phoneNumbers.length)];
  }

  String _generateWebsite() {
    final domain = widget.place.name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]'), '')
        .substring(0, min(10, widget.place.name.length));
    return 'https://www.$domain.in';
  }

  List<String> _generateOpeningHours() {
    final isRestaurant = widget.place.types.contains('restaurant');
    if (isRestaurant) {
      return [
        'Monday: 11:00 AM – 10:30 PM',
        'Tuesday: 11:00 AM – 10:30 PM',
        'Wednesday: 11:00 AM – 10:30 PM',
        'Thursday: 11:00 AM – 10:30 PM',
        'Friday: 11:00 AM – 11:00 PM',
        'Saturday: 11:00 AM – 11:00 PM',
        'Sunday: 12:00 PM – 10:00 PM',
      ];
    } else {
      return [
        'Monday: 9:00 AM – 8:00 PM',
        'Tuesday: 9:00 AM – 8:00 PM',
        'Wednesday: 9:00 AM – 8:00 PM',
        'Thursday: 9:00 AM – 8:00 PM',
        'Friday: 9:00 AM – 9:00 PM',
        'Saturday: 9:00 AM – 9:00 PM',
        'Sunday: 10:00 AM – 7:00 PM',
      ];
    }
  }

  String _generateDescription(bool isRestaurant, bool isAttraction, bool isShopping) {
    if (isRestaurant) {
      return 'A popular dining destination in Ranchi offering authentic local cuisine and modern favorites. Known for its warm ambiance, excellent service, and fresh ingredients sourced from local markets. Perfect for family dinners, casual meetups, and special celebrations.';
    } else if (isAttraction) {
      return 'One of Ranchi\'s most visited attractions, offering breathtaking views and rich cultural heritage. This destination provides visitors with unique experiences, photo opportunities, and insights into local history and traditions. Ideal for tourists and locals alike.';
    } else if (isShopping) {
      return 'A premier shopping destination featuring a wide variety of stores, brands, and services. From fashion and electronics to local handicrafts and souvenirs, this location caters to all shopping needs with modern amenities and convenient parking.';
    } else {
      return 'A well-established location in Ranchi, highly regarded by locals and visitors for its quality services and convenient location. Known for professional service, competitive prices, and customer satisfaction.';
    }
  }

  List<String> _generateAmenities(bool isRestaurant, bool isAttraction, bool isShopping) {
    final baseAmenities = ['Parking available', 'Wheelchair accessible', 'Wi-Fi'];

    if (isRestaurant) {
      return [...baseAmenities, 'Outdoor seating', 'Takeaway', 'Credit cards accepted', 'Air conditioning'];
    } else if (isAttraction) {
      return [...baseAmenities, 'Guided tours', 'Photography allowed', 'Restrooms', 'Gift shop'];
    } else if (isShopping) {
      return [...baseAmenities, 'ATM on site', 'Food court', 'Customer service', 'Multiple floors'];
    } else {
      return [...baseAmenities, 'Customer support', 'Online services'];
    }
  }

  Map<String, int> _generatePopularTimes() {
    return {
      'Monday': 60 + Random().nextInt(30),
      'Tuesday': 55 + Random().nextInt(35),
      'Wednesday': 50 + Random().nextInt(40),
      'Thursday': 65 + Random().nextInt(25),
      'Friday': 80 + Random().nextInt(20),
      'Saturday': 90 + Random().nextInt(10),
      'Sunday': 75 + Random().nextInt(20),
    };
  }

  List<PlaceReview> _generateReviews() {
    final reviewData = [
      {
        'text':
            'Excellent place with great atmosphere! The service was outstanding and the experience exceeded my expectations. Highly recommended for anyone visiting Ranchi.',
        'sentiment': ReviewSentiment.positive,
        'score': 0.92,
        'topics': ['service', 'atmosphere', 'experience'],
      },
      {
        'text':
            'Good location and reasonable prices. Staff was helpful and the facilities were clean and well-maintained. Will definitely visit again.',
        'sentiment': ReviewSentiment.positive,
        'score': 0.78,
        'topics': ['location', 'price', 'cleanliness'],
      },
      {
        'text':
            'Amazing experience! The quality is top-notch and the ambiance is perfect. Great value for money and wonderful for families.',
        'sentiment': ReviewSentiment.positive,
        'score': 0.89,
        'topics': ['quality', 'ambiance', 'value', 'family-friendly'],
      },
      {
        'text':
            'Very satisfied with the service. Professional staff, clean environment, and convenient location. One of the best in Ranchi.',
        'sentiment': ReviewSentiment.positive,
        'score': 0.85,
        'topics': ['service', 'staff', 'location'],
      },
      {
        'text':
            'Outstanding! Everything from the welcome to the final experience was perfect. Truly a gem in the heart of the city.',
        'sentiment': ReviewSentiment.positive,
        'score': 0.95,
        'topics': ['experience', 'hospitality', 'overall quality'],
      },
    ];

    final reviewerNames = [
      'Rajesh Kumar',
      'Priya Sharma',
      'Amit Singh',
      'Kavita Gupta',
      'Rohit Verma',
      'Sunita Jha',
      'Manoj Tiwari',
      'Neha Kumari',
    ];

    return List.generate(5, (index) {
      final rating = 3.5 + Random().nextDouble() * 1.5;
      final data = reviewData[index];

      return PlaceReview(
        reviewerName: reviewerNames[Random().nextInt(reviewerNames.length)],
        rating: double.parse(rating.toStringAsFixed(1)),
        text: data['text'] as String,
        timeAgo: '${Random().nextInt(30) + 1} days ago',
        reviewerPhotoUrl: null,
        sentiment: data['sentiment'] as ReviewSentiment,
        sentimentScore: data['score'] as double,
        keyTopics: data['topics'] as List<String>,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, MediaQuery.of(context).size.height * _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -5))],
              ),
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(child: _isLoading ? _buildLoadingState() : _buildContent()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(height: 16),

          // Title and actions
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.place.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber.shade600, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          widget.place.rating.toStringAsFixed(1),
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${_detailedInfo?.userRatingsTotal ?? 0} reviews)',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: _isSaved ? Colors.blue.shade600 : Colors.grey.shade600,
                    ),
                    onPressed: () {
                      setState(() {
                        _isSaved = !_isSaved;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.grey.shade600),
                    onPressed: () {
                      // Implement share functionality
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.grey.shade600),
                    onPressed: widget.onClose ?? () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.blue.shade600),
          const SizedBox(height: 16),
          Text('Loading place details...', style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickActions(),
          const SizedBox(height: 20),
          _buildPhotosSection(),
          const SizedBox(height: 20),
          _buildBasicInfo(),
          const SizedBox(height: 20),
          _buildDescription(),
          const SizedBox(height: 20),
          _buildOpeningHours(),
          const SizedBox(height: 20),
          _buildAmenities(),
          const SizedBox(height: 20),
          _buildPopularTimes(),
          const SizedBox(height: 20),
          _buildReviewsSection(),
          const SizedBox(height: 100), // Extra space for bottom actions
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: widget.onNavigate,
            icon: const Icon(Icons.directions, color: Colors.white),
            label: const Text('Directions', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // Implement call functionality
            },
            icon: Icon(Icons.phone, color: Colors.blue.shade600),
            label: Text('Call', style: TextStyle(color: Colors.blue.shade600)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              side: BorderSide(color: Colors.blue.shade600),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // Implement website functionality
            },
            icon: Icon(Icons.web, color: Colors.blue.shade600),
            label: Text('Website', style: TextStyle(color: Colors.blue.shade600)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              side: BorderSide(color: Colors.blue.shade600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Photos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4, // Mock photo count
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                margin: EdgeInsets.only(right: index < 3 ? 12 : 0),
                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.image, size: 40, color: Colors.grey.shade500),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBasicInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildInfoRow(Icons.location_on, 'Address', widget.place.address),
          const Divider(height: 20),
          _buildInfoRow(Icons.phone, 'Phone', _detailedInfo?.phoneNumber ?? 'Not available'),
          const Divider(height: 20),
          _buildInfoRow(Icons.web, 'Website', _detailedInfo?.website ?? 'Not available'),
          const Divider(height: 20),
          _buildInfoRow(
            widget.place.openNow ? Icons.schedule : Icons.schedule_outlined,
            'Status',
            widget.place.openNow ? 'Open now' : 'Closed',
            statusColor: widget.place.openNow ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {Color? statusColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: statusColor ?? Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text(
          _detailedInfo?.description ?? 'No description available.',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildOpeningHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Opening Hours', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children:
                _detailedInfo?.openingHours
                    .map(
                      (hour) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(hour.split(':')[0], style: const TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              hour.substring(hour.indexOf(':') + 1).trim(),
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList() ??
                [],
          ),
        ),
      ],
    );
  }

  Widget _buildAmenities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Amenities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: (_detailedInfo?.amenities ?? [])
              .map(
                (amenity) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.blue.shade200),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    amenity,
                    style: TextStyle(color: Colors.blue.shade700, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildPopularTimes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Popular Times', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: (_detailedInfo?.popularTimes.entries ?? [])
                .map(
                  (entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.w500)),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: entry.value,
                                child: Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              Expanded(flex: 100 - entry.value, child: Container()),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${entry.value}%',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                // Show all reviews
              },
              child: Text('See all', style: TextStyle(color: Colors.blue.shade600)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...(_reviews.take(3).map((review) => _buildReviewCard(review)).toList()),
      ],
    );
  }

  Widget _buildReviewCard(PlaceReview review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  review.reviewerName.substring(0, 1),
                  style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.reviewerName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              size: 12,
                              color: index < review.rating.floor() ? Colors.amber.shade600 : Colors.grey.shade300,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(review.timeAgo, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Sentiment Analysis Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: review.sentiment.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: review.sentiment.color.withOpacity(0.3), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.analytics_outlined, size: 16, color: Colors.grey.shade600),
                    const SizedBox(width: 6),
                    Text(
                      'Sentiment Analysis',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: review.sentiment.color, borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(review.sentiment.icon, size: 12, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            review.sentiment.label,
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Confidence Score
                Row(
                  children: [
                    Text('Confidence: ', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                    Text(
                      '${(review.sentimentScore * 100).toInt()}%',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: review.sentiment.color),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: review.sentimentScore,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(review.sentiment.color),
                        minHeight: 3,
                      ),
                    ),
                  ],
                ),

                // Key Topics
                if (review.keyTopics.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: review.keyTopics.map((topic) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200, width: 0.5),
                        ),
                        child: Text(
                          topic,
                          style: TextStyle(fontSize: 9, color: Colors.blue.shade700, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 12),
          Text(review.text, style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.4)),
        ],
      ),
    );
  }
}

// Extended PlaceInfo class with additional fields
class PlaceInfo extends PlaceRecommendation {
  final String? description;
  final List<String> amenities;
  final Map<String, int> popularTimes;
  final String? businessStatus;
  final int? userRatingsTotal;
  final List<String> openingHours;

  PlaceInfo({
    required String placeId,
    required String name,
    required String address,
    required LatLng location,
    required double rating,
    required int priceLevel,
    required List<String> types,
    String? photoReference,
    required bool openNow,
    double recommendationScore = 0.0,
    String recommendationReason = '',
    String? phoneNumber,
    String? website,
    String? vicinity,
    this.description,
    this.amenities = const [],
    this.popularTimes = const {},
    this.businessStatus,
    this.userRatingsTotal,
    this.openingHours = const [],
  }) : super(
         placeId: placeId,
         name: name,
         address: address,
         location: location,
         rating: rating,
         priceLevel: priceLevel,
         types: types,
         photoReference: photoReference,
         openNow: openNow,
         recommendationScore: recommendationScore,
         recommendationReason: recommendationReason,
         phoneNumber: phoneNumber,
         website: website,
         vicinity: vicinity,
       );
}

class PlaceReview {
  final String reviewerName;
  final double rating;
  final String text;
  final String timeAgo;
  final String? reviewerPhotoUrl;
  final ReviewSentiment sentiment;
  final double sentimentScore;
  final List<String> keyTopics;

  PlaceReview({
    required this.reviewerName,
    required this.rating,
    required this.text,
    required this.timeAgo,
    this.reviewerPhotoUrl,
    required this.sentiment,
    required this.sentimentScore,
    this.keyTopics = const [],
  });
}

enum ReviewSentiment { positive, negative, neutral, mixed }

extension ReviewSentimentExt on ReviewSentiment {
  String get label {
    switch (this) {
      case ReviewSentiment.positive:
        return 'Positive';
      case ReviewSentiment.negative:
        return 'Negative';
      case ReviewSentiment.neutral:
        return 'Neutral';
      case ReviewSentiment.mixed:
        return 'Mixed';
    }
  }

  Color get color {
    switch (this) {
      case ReviewSentiment.positive:
        return Colors.green;
      case ReviewSentiment.negative:
        return Colors.red;
      case ReviewSentiment.neutral:
        return Colors.orange;
      case ReviewSentiment.mixed:
        return Colors.purple;
    }
  }

  IconData get icon {
    switch (this) {
      case ReviewSentiment.positive:
        return Icons.sentiment_very_satisfied;
      case ReviewSentiment.negative:
        return Icons.sentiment_very_dissatisfied;
      case ReviewSentiment.neutral:
        return Icons.sentiment_neutral;
      case ReviewSentiment.mixed:
        return Icons.sentiment_satisfied;
    }
  }
}
