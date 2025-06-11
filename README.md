# Blockchain-Based Marketing Attribution and Analytics

A comprehensive blockchain solution for marketing attribution, campaign tracking, and ROI optimization built on the Stacks blockchain using Clarity smart contracts.

## Overview

This system provides a decentralized platform for marketing agencies and businesses to track, attribute, and optimize their marketing campaigns with transparency and immutability guaranteed by blockchain technology.

## Features

### 🏢 Agency Verification
- Register and verify marketing agencies
- Reputation scoring system
- Status management (pending, verified, rejected, suspended)
- Decentralized agency validation

### 📊 Campaign Tracking
- Create and manage marketing campaigns
- Real-time performance metrics tracking
- Budget management and spending oversight
- ROI and CTR calculations

### 🎯 Attribution Modeling
- Multiple attribution models (First Touch, Last Touch, Linear, Time Decay)
- Customer touchpoint recording
- Attribution weight calculations
- Cross-channel attribution analysis

### 🛤️ Customer Journey Mapping
- Complete customer journey tracking
- Multi-stage journey analysis (Awareness → Advocacy)
- Engagement scoring
- Conversion probability modeling

### 💰 ROI Optimization
- Automated optimization rules
- Budget reallocation strategies
- Performance-based recommendations
- Effectiveness tracking

## Smart Contracts

### 1. Agency Verification Contract (\`agency-verification.clar\`)
Manages the registration and verification of marketing agencies.

**Key Functions:**
- \`register-agency\`: Register a new marketing agency
- \`verify-agency\`: Verify an agency (admin only)
- \`update-reputation\`: Update agency reputation score
- \`get-agency\`: Retrieve agency information

### 2. Campaign Tracking Contract (\`campaign-tracking.clar\`)
Tracks marketing campaign performance and metrics.

**Key Functions:**
- \`create-campaign\`: Create a new marketing campaign
- \`update-metrics\`: Update campaign performance metrics
- \`calculate-roi\`: Calculate campaign return on investment
- \`calculate-ctr\`: Calculate click-through rate

### 3. Attribution Modeling Contract (\`attribution-modeling.clar\`)
Models marketing attribution across different touchpoints.

**Key Functions:**
- \`record-touchpoint\`: Record customer touchpoints
- \`create-attribution-model\`: Create attribution models
- \`calculate-attribution-weight\`: Calculate attribution weights

### 4. Customer Journey Contract (\`customer-journey.clar\`)
Maps and analyzes customer journey analytics.

**Key Functions:**
- \`create-journey\`: Create a new customer journey
- \`record-journey-event\`: Record journey events
- \`update-conversion-probability\`: Update conversion probability

### 5. ROI Optimization Contract (\`roi-optimization.clar\`)
Optimizes marketing return on investment.

**Key Functions:**
- \`create-optimization-rule\`: Create optimization rules
- \`optimize-campaign\`: Apply optimization to campaigns
- \`calculate-optimization-effectiveness\`: Calculate optimization effectiveness

## Getting Started

### Prerequisites
- Stacks blockchain node
- Clarity CLI tools
- Node.js and npm (for testing)

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd blockchain-marketing-attribution
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to Stacks blockchain:

\`\`\`bash
# Deploy agency verification contract
clarinet deploy contracts/agency-verification.clar

# Deploy campaign tracking contract
clarinet deploy contracts/campaign-tracking.clar

# Deploy attribution modeling contract
clarinet deploy contracts/attribution-modeling.clar

# Deploy customer journey contract
clarinet deploy contracts/customer-journey.clar

# Deploy ROI optimization contract
clarinet deploy contracts/roi-optimization.clar
\`\`\`

## Usage Examples

### Register a Marketing Agency

\`\`\`clarity
(contract-call? .agency-verification register-agency "Digital Marketing Pro")
\`\`\`

### Create a Marketing Campaign

\`\`\`clarity
(contract-call? .campaign-tracking create-campaign
u1                    ;; agency-id
"Summer Sale 2024"    ;; campaign name
u1000                 ;; start date
u2000                 ;; end date
u50000                ;; budget
)
\`\`\`

### Record Customer Touchpoint

\`\`\`clarity
(contract-call? .attribution-modeling record-touchpoint
u123                  ;; customer-id
u1                    ;; campaign-id
"google-ads"          ;; channel
u1000                 ;; conversion-value
)
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Agency registration and verification
- Campaign creation and tracking
- Attribution modeling
- Customer journey mapping
- ROI optimization

## Architecture

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                    Frontend Application                     │
├─────────────────────────────────────────────────────────────┤
│                    Stacks Blockchain                       │
├─────────────────────────────────────────────────────────────┤
│  Agency      Campaign     Attribution    Customer    ROI   │
│Verification   Tracking      Modeling      Journey   Optim. │
│   Contract    Contract      Contract      Contract Contract │
└─────────────────────────────────────────────────────────────┘
\`\`\`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.
