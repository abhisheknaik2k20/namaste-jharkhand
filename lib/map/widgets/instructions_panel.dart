import 'package:flutter/material.dart';
import '../models/navigation_instruction.dart';
import '../utils/app_theme.dart';

class InstructionsPanel extends StatelessWidget {
  final List<NavigationInstruction> instructions;

  const InstructionsPanel({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    if (instructions.isEmpty) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.directions_off, size: 48, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No route instructions available',
                style: TextStyle(color: AppTheme.primaryGrey),
              ),
            ],
          ),
        ),
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.dividerGrey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Container(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.directions,
                        color: Colors.blue.shade600,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Turn-by-Turn Directions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkGrey,
                            ),
                          ),
                          Text(
                            '${instructions.length} steps',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.primaryGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: AppTheme.primaryGrey),
                    ),
                  ],
                ),
              ),

              // Instructions List
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: instructions.length,
                  itemBuilder: (context, index) {
                    return _buildInstructionTile(
                      instructions[index],
                      index + 1,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInstructionTile(
    NavigationInstruction instruction,
    int stepNumber,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGrey),
      ),
      child: Row(
        children: [
          // Step number
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                '$stepNumber',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          SizedBox(width: 16),

          // Direction icon
          _buildDirectionIcon(instruction.sign),

          SizedBox(width: 16),

          // Instruction details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instruction.text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkGrey,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.straighten, size: 14, color: AppTheme.iconGrey),
                    SizedBox(width: 4),
                    Text(
                      instruction.formattedDistance,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.primaryGrey,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.access_time, size: 14, color: AppTheme.iconGrey),
                    SizedBox(width: 4),
                    Text(
                      instruction.formattedTime,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.primaryGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionIcon(String sign) {
    IconData iconData;
    Color color = Colors.blue;

    switch (sign.toLowerCase()) {
      case 'turn left':
      case 'turn slight left':
        iconData = Icons.turn_left;
        break;
      case 'turn right':
      case 'turn slight right':
        iconData = Icons.turn_right;
        break;
      case 'turn sharp left':
        iconData = Icons.turn_sharp_left;
        break;
      case 'turn sharp right':
        iconData = Icons.turn_sharp_right;
        break;
      case 'u-turn':
      case 'u-turn left':
      case 'u-turn right':
        iconData = Icons.u_turn_left;
        color = Colors.orange;
        break;
      case 'destination reached':
        iconData = Icons.flag;
        color = Colors.green;
        break;
      case 'continue straight':
      default:
        iconData = Icons.straight;
        break;
    }

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(iconData, color: color, size: 20),
    );
  }
}
