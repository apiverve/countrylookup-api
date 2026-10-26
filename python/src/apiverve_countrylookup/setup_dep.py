from setuptools import setup, find_packages

setup(
    name='apiverve_countrylookup',
    version='1.2.3',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Country Lookup matches any country name or ISO code to its official names, ISO 3166 codes, capitals, region, languages, and flag emoji. Paid plans add coordinates and major cities.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/countrylookup?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
