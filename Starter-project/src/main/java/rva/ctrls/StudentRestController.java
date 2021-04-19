package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Departman;
import rva.jpa.Status;
import rva.jpa.Student;
import rva.repository.DepartmanRepository;
import rva.repository.StatusRepository;
import rva.repository.StudentRepository;

@CrossOrigin
@RestController
@Api(tags = {"Student CRUD operacije"})
public class StudentRestController {
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired DepartmanRepository departmanRepository;
	
	@Autowired StatusRepository statusRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@GetMapping("student")
	@ApiOperation(value = "Vraca kolekciju svih studenata iz baze podataka")
	public Collection<Student> getStudenti() {
		return studentRepository.findAll();
	}
	
	@GetMapping("student/{id}")
	@ApiOperation(value = "Vraca studenta u odnosu na posledjenu vrednost path varijable id")
	public Student getStudent(@PathVariable("id") Integer id) {
		return studentRepository.getOne(id);
	}
	
	@GetMapping("studentiDepartman/{id}")
	@ApiOperation(value = "Vraca kolekciju studenata koji pripadaju departmanu cija vrednost obelezja id odgovara vrednosti path varijable id")
	public Collection<Student> getStudentiByDepartman(@PathVariable("id") Integer id) {
		Departman d = departmanRepository.getOne(id);
		return studentRepository.findByDepartman(d);
	}
	
	@GetMapping("studentiStatus/{id}") 
	@ApiOperation(value = "Vraca kolekciju studenata koji imaju status cija vrednost obelezja id odgovara vrednosti path varijable id")
	public Collection<Student> getStudentiByStatus(@PathVariable("id") Integer id) {
		Status s = statusRepository.getOne(id);
		return studentRepository.findByStatus(s);
	}
	
	@GetMapping("studentIme/{ime}")
	@ApiOperation(value = "Vraca kolekciju studentana koji imaju ime koji sadrzi vrednost prosledjenu u okviru path varijable ime")
	public Collection<Student> getStudentByIme(@PathVariable("ime") String ime) {
		return studentRepository.findByImeContainingIgnoreCase(ime);
	}
	
	@GetMapping("studentPrezime/{prezime}")
	@ApiOperation(value = "Vraca kolekciju studentana koji imaju prezime koji sadrzi vrednost prosledjenu u okviru path varijable prezime")
	public Collection<Student> getStudentByPrezime(@PathVariable("prezime") String prezime) {
		return studentRepository.findByPrezimeContainingIgnoreCase(prezime);
	}
	
	@PostMapping("student")
	@ApiOperation(value = "Dodaje novog studenta u bazu podataka")
	public ResponseEntity<Student> insertStudent(@RequestBody Student student) {
		if(!studentRepository.existsById(student.getId())) {
			studentRepository.save(student);
			return new ResponseEntity<Student>(HttpStatus.OK);
		}
		return new ResponseEntity<Student>(HttpStatus.CONFLICT);
	}
	
	@PutMapping("student") 
	@ApiOperation(value = "Update-uje postojeceg studenta")
	public ResponseEntity<Student> updateStudent(@RequestBody Student student) {
		if(!studentRepository.existsById(student.getId())) {
			return new ResponseEntity<Student>(HttpStatus.CONFLICT);
		}
		studentRepository.save(student);
		return new ResponseEntity<Student>(HttpStatus.OK);
	}
	
	@DeleteMapping("student/{id}")
	@ApiOperation(value = "Brise studenta u odnosu na vrednost posledjene path varijable id")
	public ResponseEntity<Student> deleteStudent(@PathVariable("id") Integer id) {
		if(!studentRepository.existsById(id)) {
			return new ResponseEntity<Student>(HttpStatus.CONFLICT);
		}
		studentRepository.deleteById(id);
		if(id == -100) {
			jdbcTemplate.execute(" INSERT INTO student (\"id\", \"ime\", \"prezime\", \"broj_indeksa\", \"status\", \"departman\") "
					+ " VALUES (-100, 'Test ime', 'Test prezime', 'Test broj indeksa', 1, 1) ");
		}
		return new ResponseEntity<Student>(HttpStatus.OK);
	}
	
}
