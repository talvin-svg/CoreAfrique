import 'package:coreafrique/core/data/models/service.dart';

/// Static list of services offered by Core Afrique Investment Ltd
/// Two core service lines: Investment Advisory and Blockchain Education

// Investment & Strategic Advisory Services
final List<Service> investmentAdvisoryServices = [
  Service(
    id: 'inv-1',
    name: 'Investment Readiness & Capital Structuring',
    shortDescription: 'Business model refinement, pitch deck development, financial modeling, and investor engagement strategy',
    category: 'Investment Advisory',
    icon: 'account_balance',
  ),
  Service(
    id: 'inv-2',
    name: 'Blockchain & Digital Asset Advisory',
    shortDescription: 'Blockchain use-case assessment, tokenization strategy, Web3 business models, and compliance considerations',
    category: 'Investment Advisory',
    icon: 'currency_bitcoin',
  ),
  Service(
    id: 'inv-3',
    name: 'Market Entry & Growth Strategy',
    shortDescription: 'Ghana and Africa-focused market intelligence, regulatory landscape analysis, and strategic partnerships',
    category: 'Investment Advisory',
    icon: 'trending_up',
  ),
  Service(
    id: 'inv-4',
    name: 'Financial Modeling & Valuation',
    shortDescription: 'Investment valuations, financial projections, and due diligence for digital economy projects',
    category: 'Investment Advisory',
    icon: 'calculate',
  ),
];

// Blockchain Education & Advocacy Services (VASP-Aligned)
final List<Service> blockchainEducationServices = [
  Service(
    id: 'edu-1',
    name: 'Blockchain & Digital Assets Courses',
    shortDescription: 'Structured courses for beginners, professionals, entrepreneurs, and students on Blockchain fundamentals and Web3',
    category: 'Blockchain Education',
    icon: 'school',
  ),
  Service(
    id: 'edu-2',
    name: 'Corporate & Institutional Training',
    shortDescription: 'Customized workshops for financial institutions, corporates, government agencies, and NGOs',
    category: 'Blockchain Education',
    icon: 'business_center',
  ),
  Service(
    id: 'edu-3',
    name: 'Public Advocacy & Ecosystem Engagement',
    shortDescription: 'Public seminars, webinars, community education, and policy-aligned thought leadership',
    category: 'Blockchain Education',
    icon: 'campaign',
  ),
  Service(
    id: 'edu-4',
    name: 'VASP Compliance Education',
    shortDescription: 'Training for VASP license holders on Ghana\'s regulatory framework and compliance requirements',
    category: 'Blockchain Education',
    icon: 'verified_user',
  ),
];

/// Combined services list for backward compatibility
final List<Service> servicesData = [
  ...investmentAdvisoryServices,
  ...blockchainEducationServices,
];

