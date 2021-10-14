using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Threading.Tasks;
using System.Web.UI;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected async void OnClick(object sender, EventArgs e)
    {
        await SendMail();
    }




    private async Task SendMail()
    {

        var name = nameTextBox.Text.Trim();
        var email = emailTextBox.Text.Trim();
        var companyName = companyNameTextBox.Text.Trim();
        var contactNumber = contactNumberTextBox.Text.Trim();


        //var apiKey = Environment.GetEnvironmentVariable("SENDGRID_API_KEY");
        var apiKey = "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";
        var client = new SendGridClient(apiKey);


        //CHANGE HERE
        var from = new EmailAddress("arshiya.siddique@meeza.net", "H.E. Arshiya Siddique");


        //PUT THE SUBJECT HERE
        var subject = "Dc Safety Rules Acknowledged";


        var cc = new EmailAddress(email, name);
        var to = new EmailAddress("arshiya.siddique@meeza.net", "H.E. Arshiya Siddique");


        //var plainTextContent = $"Name - {name}, Email - {email}, Company Name - {companyName}, Contact Number - {contactNumber} ";

        var plainTextContent = string.Format("Name - {0}, Email - {1}, Company Name - {2}, Contact Number - {3}", name, email, companyName, contactNumber);



        //var htmlContent = "<strong>and easy to do anywhere, even with C#</strong>";
        var htmlContent = string.Format("<table> <thead>   <tr>     <th>Name</th>     <td>{0}</td>   </tr> </thead> <tbody>   <tr>     <th>Email</th>     <td>{1}</td>   </tr>   <tr>     <th>Company Name</th>     <td>{2}</td>   </tr>   <tr>     <th>Contact Number</th>     <td>{3}</td>   </tr> </tbody> </table>", name, email, companyName, contactNumber);


        var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);

        msg.AddCc(cc);


        var response = await client.SendEmailAsync(msg).ConfigureAwait(false);

        if (response.IsSuccessStatusCode)
        {
            Response.Redirect("https://www.meeza.net/");
        }
        else
        {
            Response.Write("ERROR");
        }

    }
}