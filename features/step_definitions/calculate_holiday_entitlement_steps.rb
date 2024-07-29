Given('I navigate to the homepage') do 
    visit 'https://www.gov.uk/calculate-your-holiday-entitlement'
    sleep 1
end

When('I select the option hours worked per week') do ||
  // Write code here that turns the phrase above into concrete actions
end

And('I should see the homepage') do
    expect(page).to have_title 'Calculate holiday entitlement - GOV.UK'
    expect(page).to have_css 'h1.govuk-heading-xl'
    expect(page).to have_link 'Start now'
    expect(page).to have_content 'Use this tool to calculate holiday entitlement for:'
end

When ("I click on the 'Start now' button") do
    
end

And("I select the option no for working irregular hours") do
      
end

And ('I select the option hours worked per week') do
    
end

And ('I select the option for a full leave year') do
      
end

And ('I input 37.5 hours worked per week') do
     
end

And ('I input 5 days worked per week') do
    
end

Then ('I should see the correct submitted answers') do
    
end

And ('I should see the total entitlement hours') do
    
end