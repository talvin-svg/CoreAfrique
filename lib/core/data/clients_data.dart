/// Client categories and examples for Core Afrique Investments Limited
class ClientCategory {
  final String category;
  final List<String> examples;

  const ClientCategory({
    required this.category,
    required this.examples,
  });
}

final List<ClientCategory> clientsData = [
  const ClientCategory(
    category: 'Government Ministries, Departments and Agencies',
    examples: [
      'Ministry of Trade & Industry',
      'Ministry of Finance & Economic Planning',
      'Ministry of Harbours & Railways',
    ],
  ),
  const ClientCategory(
    category: 'International Lending Agencies and Donor Organizations',
    examples: [
      'World Bank',
      'International Monetary Fund (IMF)',
      'African Development Bank (AfDB)',
      'European Union (EU)',
      'USAID',
      'DFID (UK Department for International Development)',
    ],
  ),
  const ClientCategory(
    category: 'Multinational Corporations/Companies',
    examples: [
      'Big 4 Accounting Firms',
      'Major International Corporations',
    ],
  ),
  const ClientCategory(
    category: 'State-Owned Corporations/Companies',
    examples: [
      'Ghana National Petroleum Corporation (GNPC)',
      'Volta River Authority (VRA)',
      'GRIDco',
      'Chamber of Mines',
    ],
  ),
  const ClientCategory(
    category: 'Other Reputable Organizations',
    examples: [
      'West African Gas Pipeline Company Limited',
      'Various Professional Bodies',
      'Non-Governmental Organisations (NGOs)',
    ],
  ),
];

